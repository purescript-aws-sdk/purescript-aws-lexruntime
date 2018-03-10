

-- | <p>Amazon Lex provides both build and runtime endpoints. Each endpoint provides a set of operations (API). Your conversational bot uses the runtime API to understand user utterances (user input text or voice). For example, suppose a user says "I want pizza", your bot sends this input to Amazon Lex using the runtime API. Amazon Lex recognizes that the user request is for the OrderPizza intent (one of the intents defined in the bot). Then Amazon Lex engages in user conversation on behalf of the bot to elicit required information (slot values, such as pizza size and crust type), and then performs fulfillment activity (that you configured when you created the bot). You use the build-time API to create and manage your Amazon Lex bot. For a list of build-time operations, see the build-time API, . </p>
module AWS.LexRuntime where

import Prelude
import Control.Monad.Aff (Aff)
import Control.Monad.Eff.Exception (EXCEPTION)
import Data.Foreign as Foreign
import Data.Foreign.NullOrUndefined (NullOrUndefined(..))
import Data.Foreign.Class (class Decode, class Encode)
import Data.Foreign.Generic (defaultOptions, genericDecode, genericEncode)
import Data.Foreign.NullOrUndefined as NullOrUndefined
import Data.Generic.Rep (class Generic)
import Data.Generic.Rep.Show (genericShow)
import Data.Maybe (Maybe(..))
import Data.Newtype (class Newtype)
import Data.StrMap as StrMap

import AWS.Request as Request
import AWS.Request.Types as Types

serviceName = "LexRuntime" :: String


-- | <p> Sends user input (text or speech) to Amazon Lex. Clients use this API to send text and audio requests to Amazon Lex at runtime. Amazon Lex interprets the user input using the machine learning model that it built for the bot. </p> <p>The <code>PostContent</code> operation supports audio input at 8kHz and 16kHz. You can use 8kHz audio to achieve higher speech recognition accuracy in telephone audio applications. </p> <p> In response, Amazon Lex returns the next message to convey to the user. Consider the following example messages: </p> <ul> <li> <p> For a user input "I would like a pizza," Amazon Lex might return a response with a message eliciting slot data (for example, <code>PizzaSize</code>): "What size pizza would you like?". </p> </li> <li> <p> After the user provides all of the pizza order information, Amazon Lex might return a response with a message to get user confirmation: "Order the pizza?". </p> </li> <li> <p> After the user replies "Yes" to the confirmation prompt, Amazon Lex might return a conclusion statement: "Thank you, your cheese pizza has been ordered.". </p> </li> </ul> <p> Not all Amazon Lex messages require a response from the user. For example, conclusion statements do not require a response. Some messages require only a yes or no response. In addition to the <code>message</code>, Amazon Lex provides additional context about the message in the response that you can use to enhance client behavior, such as displaying the appropriate client user interface. Consider the following examples: </p> <ul> <li> <p> If the message is to elicit slot data, Amazon Lex returns the following context information: </p> <ul> <li> <p> <code>x-amz-lex-dialog-state</code> header set to <code>ElicitSlot</code> </p> </li> <li> <p> <code>x-amz-lex-intent-name</code> header set to the intent name in the current context </p> </li> <li> <p> <code>x-amz-lex-slot-to-elicit</code> header set to the slot name for which the <code>message</code> is eliciting information </p> </li> <li> <p> <code>x-amz-lex-slots</code> header set to a map of slots configured for the intent with their current values </p> </li> </ul> </li> <li> <p> If the message is a confirmation prompt, the <code>x-amz-lex-dialog-state</code> header is set to <code>Confirmation</code> and the <code>x-amz-lex-slot-to-elicit</code> header is omitted. </p> </li> <li> <p> If the message is a clarification prompt configured for the intent, indicating that the user intent is not understood, the <code>x-amz-dialog-state</code> header is set to <code>ElicitIntent</code> and the <code>x-amz-slot-to-elicit</code> header is omitted. </p> </li> </ul> <p> In addition, Amazon Lex also returns your application-specific <code>sessionAttributes</code>. For more information, see <a href="http://docs.aws.amazon.com/lex/latest/dg/context-mgmt.html">Managing Conversation Context</a>. </p>
postContent :: forall eff. PostContentRequest -> Aff (exception :: EXCEPTION | eff) PostContentResponse
postContent = Request.request serviceName "postContent" 


-- | <p>Sends user input (text-only) to Amazon Lex. Client applications can use this API to send requests to Amazon Lex at runtime. Amazon Lex then interprets the user input using the machine learning model it built for the bot. </p> <p> In response, Amazon Lex returns the next <code>message</code> to convey to the user an optional <code>responseCard</code> to display. Consider the following example messages: </p> <ul> <li> <p> For a user input "I would like a pizza", Amazon Lex might return a response with a message eliciting slot data (for example, PizzaSize): "What size pizza would you like?" </p> </li> <li> <p> After the user provides all of the pizza order information, Amazon Lex might return a response with a message to obtain user confirmation "Proceed with the pizza order?". </p> </li> <li> <p> After the user replies to a confirmation prompt with a "yes", Amazon Lex might return a conclusion statement: "Thank you, your cheese pizza has been ordered.". </p> </li> </ul> <p> Not all Amazon Lex messages require a user response. For example, a conclusion statement does not require a response. Some messages require only a "yes" or "no" user response. In addition to the <code>message</code>, Amazon Lex provides additional context about the message in the response that you might use to enhance client behavior, for example, to display the appropriate client user interface. These are the <code>slotToElicit</code>, <code>dialogState</code>, <code>intentName</code>, and <code>slots</code> fields in the response. Consider the following examples: </p> <ul> <li> <p>If the message is to elicit slot data, Amazon Lex returns the following context information:</p> <ul> <li> <p> <code>dialogState</code> set to ElicitSlot </p> </li> <li> <p> <code>intentName</code> set to the intent name in the current context </p> </li> <li> <p> <code>slotToElicit</code> set to the slot name for which the <code>message</code> is eliciting information </p> </li> <li> <p> <code>slots</code> set to a map of slots, configured for the intent, with currently known values </p> </li> </ul> </li> <li> <p> If the message is a confirmation prompt, the <code>dialogState</code> is set to ConfirmIntent and <code>SlotToElicit</code> is set to null. </p> </li> <li> <p>If the message is a clarification prompt (configured for the intent) that indicates that user intent is not understood, the <code>dialogState</code> is set to ElicitIntent and <code>slotToElicit</code> is set to null. </p> </li> </ul> <p> In addition, Amazon Lex also returns your application-specific <code>sessionAttributes</code>. For more information, see <a href="http://docs.aws.amazon.com/lex/latest/dg/context-mgmt.html">Managing Conversation Context</a>. </p>
postText :: forall eff. PostTextRequest -> Aff (exception :: EXCEPTION | eff) PostTextResponse
postText = Request.request serviceName "postText" 


newtype Accept = Accept String
derive instance newtypeAccept :: Newtype Accept _
derive instance repGenericAccept :: Generic Accept _
instance showAccept :: Show Accept where
  show = genericShow
instance decodeAccept :: Decode Accept where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeAccept :: Encode Accept where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }



newtype AttributesString = AttributesString String
derive instance newtypeAttributesString :: Newtype AttributesString _
derive instance repGenericAttributesString :: Generic AttributesString _
instance showAttributesString :: Show AttributesString where
  show = genericShow
instance decodeAttributesString :: Decode AttributesString where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeAttributesString :: Encode AttributesString where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }



-- | <p>Either the Amazon Lex bot is still building, or one of the dependent services (Amazon Polly, AWS Lambda) failed with an internal service error.</p>
newtype BadGatewayException = BadGatewayException 
  { "Message" :: NullOrUndefined.NullOrUndefined (ErrorMessage)
  }
derive instance newtypeBadGatewayException :: Newtype BadGatewayException _
derive instance repGenericBadGatewayException :: Generic BadGatewayException _
instance showBadGatewayException :: Show BadGatewayException where
  show = genericShow
instance decodeBadGatewayException :: Decode BadGatewayException where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeBadGatewayException :: Encode BadGatewayException where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }

-- | Constructs BadGatewayException from required parameters
newBadGatewayException :: BadGatewayException
newBadGatewayException  = BadGatewayException { "Message": (NullOrUndefined Nothing) }

-- | Constructs BadGatewayException's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newBadGatewayException' :: ( { "Message" :: NullOrUndefined.NullOrUndefined (ErrorMessage) } -> {"Message" :: NullOrUndefined.NullOrUndefined (ErrorMessage) } ) -> BadGatewayException
newBadGatewayException'  customize = (BadGatewayException <<< customize) { "Message": (NullOrUndefined Nothing) }



-- | <p> Request validation failed, there is no usable message in the context, or the bot build failed, is still in progress, or contains unbuilt changes. </p>
newtype BadRequestException = BadRequestException 
  { "message" :: NullOrUndefined.NullOrUndefined (String)
  }
derive instance newtypeBadRequestException :: Newtype BadRequestException _
derive instance repGenericBadRequestException :: Generic BadRequestException _
instance showBadRequestException :: Show BadRequestException where
  show = genericShow
instance decodeBadRequestException :: Decode BadRequestException where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeBadRequestException :: Encode BadRequestException where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }

-- | Constructs BadRequestException from required parameters
newBadRequestException :: BadRequestException
newBadRequestException  = BadRequestException { "message": (NullOrUndefined Nothing) }

-- | Constructs BadRequestException's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newBadRequestException' :: ( { "message" :: NullOrUndefined.NullOrUndefined (String) } -> {"message" :: NullOrUndefined.NullOrUndefined (String) } ) -> BadRequestException
newBadRequestException'  customize = (BadRequestException <<< customize) { "message": (NullOrUndefined Nothing) }



newtype BlobStream = BlobStream String
derive instance newtypeBlobStream :: Newtype BlobStream _
derive instance repGenericBlobStream :: Generic BlobStream _
instance showBlobStream :: Show BlobStream where
  show = genericShow
instance decodeBlobStream :: Decode BlobStream where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeBlobStream :: Encode BlobStream where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }



newtype BotAlias = BotAlias String
derive instance newtypeBotAlias :: Newtype BotAlias _
derive instance repGenericBotAlias :: Generic BotAlias _
instance showBotAlias :: Show BotAlias where
  show = genericShow
instance decodeBotAlias :: Decode BotAlias where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeBotAlias :: Encode BotAlias where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }



newtype BotName = BotName String
derive instance newtypeBotName :: Newtype BotName _
derive instance repGenericBotName :: Generic BotName _
instance showBotName :: Show BotName where
  show = genericShow
instance decodeBotName :: Decode BotName where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeBotName :: Encode BotName where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }



-- | <p>Represents an option to be shown on the client platform (Facebook, Slack, etc.)</p>
newtype Button = Button 
  { "text" :: (ButtonTextStringWithLength)
  , "value" :: (ButtonValueStringWithLength)
  }
derive instance newtypeButton :: Newtype Button _
derive instance repGenericButton :: Generic Button _
instance showButton :: Show Button where
  show = genericShow
instance decodeButton :: Decode Button where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeButton :: Encode Button where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }

-- | Constructs Button from required parameters
newButton :: ButtonTextStringWithLength -> ButtonValueStringWithLength -> Button
newButton _text _value = Button { "text": _text, "value": _value }

-- | Constructs Button's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newButton' :: ButtonTextStringWithLength -> ButtonValueStringWithLength -> ( { "text" :: (ButtonTextStringWithLength) , "value" :: (ButtonValueStringWithLength) } -> {"text" :: (ButtonTextStringWithLength) , "value" :: (ButtonValueStringWithLength) } ) -> Button
newButton' _text _value customize = (Button <<< customize) { "text": _text, "value": _value }



newtype ButtonTextStringWithLength = ButtonTextStringWithLength String
derive instance newtypeButtonTextStringWithLength :: Newtype ButtonTextStringWithLength _
derive instance repGenericButtonTextStringWithLength :: Generic ButtonTextStringWithLength _
instance showButtonTextStringWithLength :: Show ButtonTextStringWithLength where
  show = genericShow
instance decodeButtonTextStringWithLength :: Decode ButtonTextStringWithLength where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeButtonTextStringWithLength :: Encode ButtonTextStringWithLength where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }



newtype ButtonValueStringWithLength = ButtonValueStringWithLength String
derive instance newtypeButtonValueStringWithLength :: Newtype ButtonValueStringWithLength _
derive instance repGenericButtonValueStringWithLength :: Generic ButtonValueStringWithLength _
instance showButtonValueStringWithLength :: Show ButtonValueStringWithLength where
  show = genericShow
instance decodeButtonValueStringWithLength :: Decode ButtonValueStringWithLength where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeButtonValueStringWithLength :: Encode ButtonValueStringWithLength where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }



-- | <p> Two clients are using the same AWS account, Amazon Lex bot, and user ID. </p>
newtype ConflictException = ConflictException 
  { "message" :: NullOrUndefined.NullOrUndefined (String)
  }
derive instance newtypeConflictException :: Newtype ConflictException _
derive instance repGenericConflictException :: Generic ConflictException _
instance showConflictException :: Show ConflictException where
  show = genericShow
instance decodeConflictException :: Decode ConflictException where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeConflictException :: Encode ConflictException where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }

-- | Constructs ConflictException from required parameters
newConflictException :: ConflictException
newConflictException  = ConflictException { "message": (NullOrUndefined Nothing) }

-- | Constructs ConflictException's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newConflictException' :: ( { "message" :: NullOrUndefined.NullOrUndefined (String) } -> {"message" :: NullOrUndefined.NullOrUndefined (String) } ) -> ConflictException
newConflictException'  customize = (ConflictException <<< customize) { "message": (NullOrUndefined Nothing) }



newtype ContentType = ContentType String
derive instance newtypeContentType :: Newtype ContentType _
derive instance repGenericContentType :: Generic ContentType _
instance showContentType :: Show ContentType where
  show = genericShow
instance decodeContentType :: Decode ContentType where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeContentType :: Encode ContentType where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }



-- | <p> One of the dependencies, such as AWS Lambda or Amazon Polly, threw an exception. For example, </p> <ul> <li> <p>If Amazon Lex does not have sufficient permissions to call a Lambda function.</p> </li> <li> <p>If a Lambda function takes longer than 30 seconds to execute.</p> </li> <li> <p>If a fulfillment Lambda function returns a <code>Delegate</code> dialog action without removing any slot values.</p> </li> </ul>
newtype DependencyFailedException = DependencyFailedException 
  { "Message" :: NullOrUndefined.NullOrUndefined (ErrorMessage)
  }
derive instance newtypeDependencyFailedException :: Newtype DependencyFailedException _
derive instance repGenericDependencyFailedException :: Generic DependencyFailedException _
instance showDependencyFailedException :: Show DependencyFailedException where
  show = genericShow
instance decodeDependencyFailedException :: Decode DependencyFailedException where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeDependencyFailedException :: Encode DependencyFailedException where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }

-- | Constructs DependencyFailedException from required parameters
newDependencyFailedException :: DependencyFailedException
newDependencyFailedException  = DependencyFailedException { "Message": (NullOrUndefined Nothing) }

-- | Constructs DependencyFailedException's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newDependencyFailedException' :: ( { "Message" :: NullOrUndefined.NullOrUndefined (ErrorMessage) } -> {"Message" :: NullOrUndefined.NullOrUndefined (ErrorMessage) } ) -> DependencyFailedException
newDependencyFailedException'  customize = (DependencyFailedException <<< customize) { "Message": (NullOrUndefined Nothing) }



newtype DialogState = DialogState String
derive instance newtypeDialogState :: Newtype DialogState _
derive instance repGenericDialogState :: Generic DialogState _
instance showDialogState :: Show DialogState where
  show = genericShow
instance decodeDialogState :: Decode DialogState where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeDialogState :: Encode DialogState where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }



newtype ErrorMessage = ErrorMessage String
derive instance newtypeErrorMessage :: Newtype ErrorMessage _
derive instance repGenericErrorMessage :: Generic ErrorMessage _
instance showErrorMessage :: Show ErrorMessage where
  show = genericShow
instance decodeErrorMessage :: Decode ErrorMessage where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeErrorMessage :: Encode ErrorMessage where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }



-- | <p>Represents an option rendered to the user when a prompt is shown. It could be an image, a button, a link, or text. </p>
newtype GenericAttachment = GenericAttachment 
  { "title" :: NullOrUndefined.NullOrUndefined (StringWithLength)
  , "subTitle" :: NullOrUndefined.NullOrUndefined (StringWithLength)
  , "attachmentLinkUrl" :: NullOrUndefined.NullOrUndefined (StringUrlWithLength)
  , "imageUrl" :: NullOrUndefined.NullOrUndefined (StringUrlWithLength)
  , "buttons" :: NullOrUndefined.NullOrUndefined (ListOfButtons')
  }
derive instance newtypeGenericAttachment :: Newtype GenericAttachment _
derive instance repGenericGenericAttachment :: Generic GenericAttachment _
instance showGenericAttachment :: Show GenericAttachment where
  show = genericShow
instance decodeGenericAttachment :: Decode GenericAttachment where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeGenericAttachment :: Encode GenericAttachment where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }

-- | Constructs GenericAttachment from required parameters
newGenericAttachment :: GenericAttachment
newGenericAttachment  = GenericAttachment { "attachmentLinkUrl": (NullOrUndefined Nothing), "buttons": (NullOrUndefined Nothing), "imageUrl": (NullOrUndefined Nothing), "subTitle": (NullOrUndefined Nothing), "title": (NullOrUndefined Nothing) }

-- | Constructs GenericAttachment's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newGenericAttachment' :: ( { "title" :: NullOrUndefined.NullOrUndefined (StringWithLength) , "subTitle" :: NullOrUndefined.NullOrUndefined (StringWithLength) , "attachmentLinkUrl" :: NullOrUndefined.NullOrUndefined (StringUrlWithLength) , "imageUrl" :: NullOrUndefined.NullOrUndefined (StringUrlWithLength) , "buttons" :: NullOrUndefined.NullOrUndefined (ListOfButtons') } -> {"title" :: NullOrUndefined.NullOrUndefined (StringWithLength) , "subTitle" :: NullOrUndefined.NullOrUndefined (StringWithLength) , "attachmentLinkUrl" :: NullOrUndefined.NullOrUndefined (StringUrlWithLength) , "imageUrl" :: NullOrUndefined.NullOrUndefined (StringUrlWithLength) , "buttons" :: NullOrUndefined.NullOrUndefined (ListOfButtons') } ) -> GenericAttachment
newGenericAttachment'  customize = (GenericAttachment <<< customize) { "attachmentLinkUrl": (NullOrUndefined Nothing), "buttons": (NullOrUndefined Nothing), "imageUrl": (NullOrUndefined Nothing), "subTitle": (NullOrUndefined Nothing), "title": (NullOrUndefined Nothing) }



newtype HttpContentType = HttpContentType String
derive instance newtypeHttpContentType :: Newtype HttpContentType _
derive instance repGenericHttpContentType :: Generic HttpContentType _
instance showHttpContentType :: Show HttpContentType where
  show = genericShow
instance decodeHttpContentType :: Decode HttpContentType where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeHttpContentType :: Encode HttpContentType where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }



newtype IntentName = IntentName String
derive instance newtypeIntentName :: Newtype IntentName _
derive instance repGenericIntentName :: Generic IntentName _
instance showIntentName :: Show IntentName where
  show = genericShow
instance decodeIntentName :: Decode IntentName where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeIntentName :: Encode IntentName where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }



-- | <p>Internal service error. Retry the call.</p>
newtype InternalFailureException = InternalFailureException 
  { "message" :: NullOrUndefined.NullOrUndefined (String)
  }
derive instance newtypeInternalFailureException :: Newtype InternalFailureException _
derive instance repGenericInternalFailureException :: Generic InternalFailureException _
instance showInternalFailureException :: Show InternalFailureException where
  show = genericShow
instance decodeInternalFailureException :: Decode InternalFailureException where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeInternalFailureException :: Encode InternalFailureException where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }

-- | Constructs InternalFailureException from required parameters
newInternalFailureException :: InternalFailureException
newInternalFailureException  = InternalFailureException { "message": (NullOrUndefined Nothing) }

-- | Constructs InternalFailureException's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newInternalFailureException' :: ( { "message" :: NullOrUndefined.NullOrUndefined (String) } -> {"message" :: NullOrUndefined.NullOrUndefined (String) } ) -> InternalFailureException
newInternalFailureException'  customize = (InternalFailureException <<< customize) { "message": (NullOrUndefined Nothing) }



-- | <p>Exceeded a limit.</p>
newtype LimitExceededException = LimitExceededException 
  { "retryAfterSeconds" :: NullOrUndefined.NullOrUndefined (String)
  , "message" :: NullOrUndefined.NullOrUndefined (String)
  }
derive instance newtypeLimitExceededException :: Newtype LimitExceededException _
derive instance repGenericLimitExceededException :: Generic LimitExceededException _
instance showLimitExceededException :: Show LimitExceededException where
  show = genericShow
instance decodeLimitExceededException :: Decode LimitExceededException where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeLimitExceededException :: Encode LimitExceededException where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }

-- | Constructs LimitExceededException from required parameters
newLimitExceededException :: LimitExceededException
newLimitExceededException  = LimitExceededException { "message": (NullOrUndefined Nothing), "retryAfterSeconds": (NullOrUndefined Nothing) }

-- | Constructs LimitExceededException's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newLimitExceededException' :: ( { "retryAfterSeconds" :: NullOrUndefined.NullOrUndefined (String) , "message" :: NullOrUndefined.NullOrUndefined (String) } -> {"retryAfterSeconds" :: NullOrUndefined.NullOrUndefined (String) , "message" :: NullOrUndefined.NullOrUndefined (String) } ) -> LimitExceededException
newLimitExceededException'  customize = (LimitExceededException <<< customize) { "message": (NullOrUndefined Nothing), "retryAfterSeconds": (NullOrUndefined Nothing) }



-- | <p>This exception is not used.</p>
newtype LoopDetectedException = LoopDetectedException 
  { "Message" :: NullOrUndefined.NullOrUndefined (ErrorMessage)
  }
derive instance newtypeLoopDetectedException :: Newtype LoopDetectedException _
derive instance repGenericLoopDetectedException :: Generic LoopDetectedException _
instance showLoopDetectedException :: Show LoopDetectedException where
  show = genericShow
instance decodeLoopDetectedException :: Decode LoopDetectedException where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeLoopDetectedException :: Encode LoopDetectedException where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }

-- | Constructs LoopDetectedException from required parameters
newLoopDetectedException :: LoopDetectedException
newLoopDetectedException  = LoopDetectedException { "Message": (NullOrUndefined Nothing) }

-- | Constructs LoopDetectedException's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newLoopDetectedException' :: ( { "Message" :: NullOrUndefined.NullOrUndefined (ErrorMessage) } -> {"Message" :: NullOrUndefined.NullOrUndefined (ErrorMessage) } ) -> LoopDetectedException
newLoopDetectedException'  customize = (LoopDetectedException <<< customize) { "Message": (NullOrUndefined Nothing) }



newtype MessageFormatType = MessageFormatType String
derive instance newtypeMessageFormatType :: Newtype MessageFormatType _
derive instance repGenericMessageFormatType :: Generic MessageFormatType _
instance showMessageFormatType :: Show MessageFormatType where
  show = genericShow
instance decodeMessageFormatType :: Decode MessageFormatType where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeMessageFormatType :: Encode MessageFormatType where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }



-- | <p>The accept header in the request does not have a valid value.</p>
newtype NotAcceptableException = NotAcceptableException 
  { "message" :: NullOrUndefined.NullOrUndefined (String)
  }
derive instance newtypeNotAcceptableException :: Newtype NotAcceptableException _
derive instance repGenericNotAcceptableException :: Generic NotAcceptableException _
instance showNotAcceptableException :: Show NotAcceptableException where
  show = genericShow
instance decodeNotAcceptableException :: Decode NotAcceptableException where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeNotAcceptableException :: Encode NotAcceptableException where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }

-- | Constructs NotAcceptableException from required parameters
newNotAcceptableException :: NotAcceptableException
newNotAcceptableException  = NotAcceptableException { "message": (NullOrUndefined Nothing) }

-- | Constructs NotAcceptableException's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newNotAcceptableException' :: ( { "message" :: NullOrUndefined.NullOrUndefined (String) } -> {"message" :: NullOrUndefined.NullOrUndefined (String) } ) -> NotAcceptableException
newNotAcceptableException'  customize = (NotAcceptableException <<< customize) { "message": (NullOrUndefined Nothing) }



-- | <p>The resource (such as the Amazon Lex bot or an alias) that is referred to is not found.</p>
newtype NotFoundException = NotFoundException 
  { "message" :: NullOrUndefined.NullOrUndefined (String)
  }
derive instance newtypeNotFoundException :: Newtype NotFoundException _
derive instance repGenericNotFoundException :: Generic NotFoundException _
instance showNotFoundException :: Show NotFoundException where
  show = genericShow
instance decodeNotFoundException :: Decode NotFoundException where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeNotFoundException :: Encode NotFoundException where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }

-- | Constructs NotFoundException from required parameters
newNotFoundException :: NotFoundException
newNotFoundException  = NotFoundException { "message": (NullOrUndefined Nothing) }

-- | Constructs NotFoundException's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newNotFoundException' :: ( { "message" :: NullOrUndefined.NullOrUndefined (String) } -> {"message" :: NullOrUndefined.NullOrUndefined (String) } ) -> NotFoundException
newNotFoundException'  customize = (NotFoundException <<< customize) { "message": (NullOrUndefined Nothing) }



newtype PostContentRequest = PostContentRequest 
  { "botName" :: (BotName)
  , "botAlias" :: (BotAlias)
  , "userId" :: (UserId)
  , "sessionAttributes" :: NullOrUndefined.NullOrUndefined (AttributesString)
  , "requestAttributes" :: NullOrUndefined.NullOrUndefined (AttributesString)
  , "contentType" :: (HttpContentType)
  , "accept" :: NullOrUndefined.NullOrUndefined (Accept)
  , "inputStream" :: (BlobStream)
  }
derive instance newtypePostContentRequest :: Newtype PostContentRequest _
derive instance repGenericPostContentRequest :: Generic PostContentRequest _
instance showPostContentRequest :: Show PostContentRequest where
  show = genericShow
instance decodePostContentRequest :: Decode PostContentRequest where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodePostContentRequest :: Encode PostContentRequest where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }

-- | Constructs PostContentRequest from required parameters
newPostContentRequest :: BotAlias -> BotName -> HttpContentType -> BlobStream -> UserId -> PostContentRequest
newPostContentRequest _botAlias _botName _contentType _inputStream _userId = PostContentRequest { "botAlias": _botAlias, "botName": _botName, "contentType": _contentType, "inputStream": _inputStream, "userId": _userId, "accept": (NullOrUndefined Nothing), "requestAttributes": (NullOrUndefined Nothing), "sessionAttributes": (NullOrUndefined Nothing) }

-- | Constructs PostContentRequest's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newPostContentRequest' :: BotAlias -> BotName -> HttpContentType -> BlobStream -> UserId -> ( { "botName" :: (BotName) , "botAlias" :: (BotAlias) , "userId" :: (UserId) , "sessionAttributes" :: NullOrUndefined.NullOrUndefined (AttributesString) , "requestAttributes" :: NullOrUndefined.NullOrUndefined (AttributesString) , "contentType" :: (HttpContentType) , "accept" :: NullOrUndefined.NullOrUndefined (Accept) , "inputStream" :: (BlobStream) } -> {"botName" :: (BotName) , "botAlias" :: (BotAlias) , "userId" :: (UserId) , "sessionAttributes" :: NullOrUndefined.NullOrUndefined (AttributesString) , "requestAttributes" :: NullOrUndefined.NullOrUndefined (AttributesString) , "contentType" :: (HttpContentType) , "accept" :: NullOrUndefined.NullOrUndefined (Accept) , "inputStream" :: (BlobStream) } ) -> PostContentRequest
newPostContentRequest' _botAlias _botName _contentType _inputStream _userId customize = (PostContentRequest <<< customize) { "botAlias": _botAlias, "botName": _botName, "contentType": _contentType, "inputStream": _inputStream, "userId": _userId, "accept": (NullOrUndefined Nothing), "requestAttributes": (NullOrUndefined Nothing), "sessionAttributes": (NullOrUndefined Nothing) }



newtype PostContentResponse = PostContentResponse 
  { "contentType" :: NullOrUndefined.NullOrUndefined (HttpContentType)
  , "intentName" :: NullOrUndefined.NullOrUndefined (IntentName)
  , "slots" :: NullOrUndefined.NullOrUndefined (String)
  , "sessionAttributes" :: NullOrUndefined.NullOrUndefined (String)
  , "message" :: NullOrUndefined.NullOrUndefined (Text)
  , "messageFormat" :: NullOrUndefined.NullOrUndefined (MessageFormatType)
  , "dialogState" :: NullOrUndefined.NullOrUndefined (DialogState)
  , "slotToElicit" :: NullOrUndefined.NullOrUndefined (String)
  , "inputTranscript" :: NullOrUndefined.NullOrUndefined (String)
  , "audioStream" :: NullOrUndefined.NullOrUndefined (BlobStream)
  }
derive instance newtypePostContentResponse :: Newtype PostContentResponse _
derive instance repGenericPostContentResponse :: Generic PostContentResponse _
instance showPostContentResponse :: Show PostContentResponse where
  show = genericShow
instance decodePostContentResponse :: Decode PostContentResponse where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodePostContentResponse :: Encode PostContentResponse where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }

-- | Constructs PostContentResponse from required parameters
newPostContentResponse :: PostContentResponse
newPostContentResponse  = PostContentResponse { "audioStream": (NullOrUndefined Nothing), "contentType": (NullOrUndefined Nothing), "dialogState": (NullOrUndefined Nothing), "inputTranscript": (NullOrUndefined Nothing), "intentName": (NullOrUndefined Nothing), "message": (NullOrUndefined Nothing), "messageFormat": (NullOrUndefined Nothing), "sessionAttributes": (NullOrUndefined Nothing), "slotToElicit": (NullOrUndefined Nothing), "slots": (NullOrUndefined Nothing) }

-- | Constructs PostContentResponse's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newPostContentResponse' :: ( { "contentType" :: NullOrUndefined.NullOrUndefined (HttpContentType) , "intentName" :: NullOrUndefined.NullOrUndefined (IntentName) , "slots" :: NullOrUndefined.NullOrUndefined (String) , "sessionAttributes" :: NullOrUndefined.NullOrUndefined (String) , "message" :: NullOrUndefined.NullOrUndefined (Text) , "messageFormat" :: NullOrUndefined.NullOrUndefined (MessageFormatType) , "dialogState" :: NullOrUndefined.NullOrUndefined (DialogState) , "slotToElicit" :: NullOrUndefined.NullOrUndefined (String) , "inputTranscript" :: NullOrUndefined.NullOrUndefined (String) , "audioStream" :: NullOrUndefined.NullOrUndefined (BlobStream) } -> {"contentType" :: NullOrUndefined.NullOrUndefined (HttpContentType) , "intentName" :: NullOrUndefined.NullOrUndefined (IntentName) , "slots" :: NullOrUndefined.NullOrUndefined (String) , "sessionAttributes" :: NullOrUndefined.NullOrUndefined (String) , "message" :: NullOrUndefined.NullOrUndefined (Text) , "messageFormat" :: NullOrUndefined.NullOrUndefined (MessageFormatType) , "dialogState" :: NullOrUndefined.NullOrUndefined (DialogState) , "slotToElicit" :: NullOrUndefined.NullOrUndefined (String) , "inputTranscript" :: NullOrUndefined.NullOrUndefined (String) , "audioStream" :: NullOrUndefined.NullOrUndefined (BlobStream) } ) -> PostContentResponse
newPostContentResponse'  customize = (PostContentResponse <<< customize) { "audioStream": (NullOrUndefined Nothing), "contentType": (NullOrUndefined Nothing), "dialogState": (NullOrUndefined Nothing), "inputTranscript": (NullOrUndefined Nothing), "intentName": (NullOrUndefined Nothing), "message": (NullOrUndefined Nothing), "messageFormat": (NullOrUndefined Nothing), "sessionAttributes": (NullOrUndefined Nothing), "slotToElicit": (NullOrUndefined Nothing), "slots": (NullOrUndefined Nothing) }



newtype PostTextRequest = PostTextRequest 
  { "botName" :: (BotName)
  , "botAlias" :: (BotAlias)
  , "userId" :: (UserId)
  , "sessionAttributes" :: NullOrUndefined.NullOrUndefined (StringMap)
  , "requestAttributes" :: NullOrUndefined.NullOrUndefined (StringMap)
  , "inputText" :: (Text)
  }
derive instance newtypePostTextRequest :: Newtype PostTextRequest _
derive instance repGenericPostTextRequest :: Generic PostTextRequest _
instance showPostTextRequest :: Show PostTextRequest where
  show = genericShow
instance decodePostTextRequest :: Decode PostTextRequest where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodePostTextRequest :: Encode PostTextRequest where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }

-- | Constructs PostTextRequest from required parameters
newPostTextRequest :: BotAlias -> BotName -> Text -> UserId -> PostTextRequest
newPostTextRequest _botAlias _botName _inputText _userId = PostTextRequest { "botAlias": _botAlias, "botName": _botName, "inputText": _inputText, "userId": _userId, "requestAttributes": (NullOrUndefined Nothing), "sessionAttributes": (NullOrUndefined Nothing) }

-- | Constructs PostTextRequest's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newPostTextRequest' :: BotAlias -> BotName -> Text -> UserId -> ( { "botName" :: (BotName) , "botAlias" :: (BotAlias) , "userId" :: (UserId) , "sessionAttributes" :: NullOrUndefined.NullOrUndefined (StringMap) , "requestAttributes" :: NullOrUndefined.NullOrUndefined (StringMap) , "inputText" :: (Text) } -> {"botName" :: (BotName) , "botAlias" :: (BotAlias) , "userId" :: (UserId) , "sessionAttributes" :: NullOrUndefined.NullOrUndefined (StringMap) , "requestAttributes" :: NullOrUndefined.NullOrUndefined (StringMap) , "inputText" :: (Text) } ) -> PostTextRequest
newPostTextRequest' _botAlias _botName _inputText _userId customize = (PostTextRequest <<< customize) { "botAlias": _botAlias, "botName": _botName, "inputText": _inputText, "userId": _userId, "requestAttributes": (NullOrUndefined Nothing), "sessionAttributes": (NullOrUndefined Nothing) }



newtype PostTextResponse = PostTextResponse 
  { "intentName" :: NullOrUndefined.NullOrUndefined (IntentName)
  , "slots" :: NullOrUndefined.NullOrUndefined (StringMap)
  , "sessionAttributes" :: NullOrUndefined.NullOrUndefined (StringMap)
  , "message" :: NullOrUndefined.NullOrUndefined (Text)
  , "messageFormat" :: NullOrUndefined.NullOrUndefined (MessageFormatType)
  , "dialogState" :: NullOrUndefined.NullOrUndefined (DialogState)
  , "slotToElicit" :: NullOrUndefined.NullOrUndefined (String)
  , "responseCard" :: NullOrUndefined.NullOrUndefined (ResponseCard)
  }
derive instance newtypePostTextResponse :: Newtype PostTextResponse _
derive instance repGenericPostTextResponse :: Generic PostTextResponse _
instance showPostTextResponse :: Show PostTextResponse where
  show = genericShow
instance decodePostTextResponse :: Decode PostTextResponse where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodePostTextResponse :: Encode PostTextResponse where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }

-- | Constructs PostTextResponse from required parameters
newPostTextResponse :: PostTextResponse
newPostTextResponse  = PostTextResponse { "dialogState": (NullOrUndefined Nothing), "intentName": (NullOrUndefined Nothing), "message": (NullOrUndefined Nothing), "messageFormat": (NullOrUndefined Nothing), "responseCard": (NullOrUndefined Nothing), "sessionAttributes": (NullOrUndefined Nothing), "slotToElicit": (NullOrUndefined Nothing), "slots": (NullOrUndefined Nothing) }

-- | Constructs PostTextResponse's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newPostTextResponse' :: ( { "intentName" :: NullOrUndefined.NullOrUndefined (IntentName) , "slots" :: NullOrUndefined.NullOrUndefined (StringMap) , "sessionAttributes" :: NullOrUndefined.NullOrUndefined (StringMap) , "message" :: NullOrUndefined.NullOrUndefined (Text) , "messageFormat" :: NullOrUndefined.NullOrUndefined (MessageFormatType) , "dialogState" :: NullOrUndefined.NullOrUndefined (DialogState) , "slotToElicit" :: NullOrUndefined.NullOrUndefined (String) , "responseCard" :: NullOrUndefined.NullOrUndefined (ResponseCard) } -> {"intentName" :: NullOrUndefined.NullOrUndefined (IntentName) , "slots" :: NullOrUndefined.NullOrUndefined (StringMap) , "sessionAttributes" :: NullOrUndefined.NullOrUndefined (StringMap) , "message" :: NullOrUndefined.NullOrUndefined (Text) , "messageFormat" :: NullOrUndefined.NullOrUndefined (MessageFormatType) , "dialogState" :: NullOrUndefined.NullOrUndefined (DialogState) , "slotToElicit" :: NullOrUndefined.NullOrUndefined (String) , "responseCard" :: NullOrUndefined.NullOrUndefined (ResponseCard) } ) -> PostTextResponse
newPostTextResponse'  customize = (PostTextResponse <<< customize) { "dialogState": (NullOrUndefined Nothing), "intentName": (NullOrUndefined Nothing), "message": (NullOrUndefined Nothing), "messageFormat": (NullOrUndefined Nothing), "responseCard": (NullOrUndefined Nothing), "sessionAttributes": (NullOrUndefined Nothing), "slotToElicit": (NullOrUndefined Nothing), "slots": (NullOrUndefined Nothing) }



-- | <p>The input speech is too long.</p>
newtype RequestTimeoutException = RequestTimeoutException 
  { "message" :: NullOrUndefined.NullOrUndefined (String)
  }
derive instance newtypeRequestTimeoutException :: Newtype RequestTimeoutException _
derive instance repGenericRequestTimeoutException :: Generic RequestTimeoutException _
instance showRequestTimeoutException :: Show RequestTimeoutException where
  show = genericShow
instance decodeRequestTimeoutException :: Decode RequestTimeoutException where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeRequestTimeoutException :: Encode RequestTimeoutException where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }

-- | Constructs RequestTimeoutException from required parameters
newRequestTimeoutException :: RequestTimeoutException
newRequestTimeoutException  = RequestTimeoutException { "message": (NullOrUndefined Nothing) }

-- | Constructs RequestTimeoutException's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newRequestTimeoutException' :: ( { "message" :: NullOrUndefined.NullOrUndefined (String) } -> {"message" :: NullOrUndefined.NullOrUndefined (String) } ) -> RequestTimeoutException
newRequestTimeoutException'  customize = (RequestTimeoutException <<< customize) { "message": (NullOrUndefined Nothing) }



-- | <p>If you configure a response card when creating your bots, Amazon Lex substitutes the session attributes and slot values that are available, and then returns it. The response card can also come from a Lambda function ( <code>dialogCodeHook</code> and <code>fulfillmentActivity</code> on an intent).</p>
newtype ResponseCard = ResponseCard 
  { "version" :: NullOrUndefined.NullOrUndefined (String)
  , "contentType" :: NullOrUndefined.NullOrUndefined (ContentType)
  , "genericAttachments" :: NullOrUndefined.NullOrUndefined (GenericAttachmentList')
  }
derive instance newtypeResponseCard :: Newtype ResponseCard _
derive instance repGenericResponseCard :: Generic ResponseCard _
instance showResponseCard :: Show ResponseCard where
  show = genericShow
instance decodeResponseCard :: Decode ResponseCard where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeResponseCard :: Encode ResponseCard where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }

-- | Constructs ResponseCard from required parameters
newResponseCard :: ResponseCard
newResponseCard  = ResponseCard { "contentType": (NullOrUndefined Nothing), "genericAttachments": (NullOrUndefined Nothing), "version": (NullOrUndefined Nothing) }

-- | Constructs ResponseCard's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newResponseCard' :: ( { "version" :: NullOrUndefined.NullOrUndefined (String) , "contentType" :: NullOrUndefined.NullOrUndefined (ContentType) , "genericAttachments" :: NullOrUndefined.NullOrUndefined (GenericAttachmentList') } -> {"version" :: NullOrUndefined.NullOrUndefined (String) , "contentType" :: NullOrUndefined.NullOrUndefined (ContentType) , "genericAttachments" :: NullOrUndefined.NullOrUndefined (GenericAttachmentList') } ) -> ResponseCard
newResponseCard'  customize = (ResponseCard <<< customize) { "contentType": (NullOrUndefined Nothing), "genericAttachments": (NullOrUndefined Nothing), "version": (NullOrUndefined Nothing) }



newtype StringMap = StringMap (StrMap.StrMap String)
derive instance newtypeStringMap :: Newtype StringMap _
derive instance repGenericStringMap :: Generic StringMap _
instance showStringMap :: Show StringMap where
  show = genericShow
instance decodeStringMap :: Decode StringMap where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeStringMap :: Encode StringMap where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }



newtype StringUrlWithLength = StringUrlWithLength String
derive instance newtypeStringUrlWithLength :: Newtype StringUrlWithLength _
derive instance repGenericStringUrlWithLength :: Generic StringUrlWithLength _
instance showStringUrlWithLength :: Show StringUrlWithLength where
  show = genericShow
instance decodeStringUrlWithLength :: Decode StringUrlWithLength where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeStringUrlWithLength :: Encode StringUrlWithLength where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }



newtype StringWithLength = StringWithLength String
derive instance newtypeStringWithLength :: Newtype StringWithLength _
derive instance repGenericStringWithLength :: Generic StringWithLength _
instance showStringWithLength :: Show StringWithLength where
  show = genericShow
instance decodeStringWithLength :: Decode StringWithLength where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeStringWithLength :: Encode StringWithLength where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }



newtype Text = Text String
derive instance newtypeText :: Newtype Text _
derive instance repGenericText :: Generic Text _
instance showText :: Show Text where
  show = genericShow
instance decodeText :: Decode Text where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeText :: Encode Text where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }



-- | <p>The Content-Type header (<code>PostContent</code> API) has an invalid value. </p>
newtype UnsupportedMediaTypeException = UnsupportedMediaTypeException 
  { "message" :: NullOrUndefined.NullOrUndefined (String)
  }
derive instance newtypeUnsupportedMediaTypeException :: Newtype UnsupportedMediaTypeException _
derive instance repGenericUnsupportedMediaTypeException :: Generic UnsupportedMediaTypeException _
instance showUnsupportedMediaTypeException :: Show UnsupportedMediaTypeException where
  show = genericShow
instance decodeUnsupportedMediaTypeException :: Decode UnsupportedMediaTypeException where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeUnsupportedMediaTypeException :: Encode UnsupportedMediaTypeException where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }

-- | Constructs UnsupportedMediaTypeException from required parameters
newUnsupportedMediaTypeException :: UnsupportedMediaTypeException
newUnsupportedMediaTypeException  = UnsupportedMediaTypeException { "message": (NullOrUndefined Nothing) }

-- | Constructs UnsupportedMediaTypeException's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newUnsupportedMediaTypeException' :: ( { "message" :: NullOrUndefined.NullOrUndefined (String) } -> {"message" :: NullOrUndefined.NullOrUndefined (String) } ) -> UnsupportedMediaTypeException
newUnsupportedMediaTypeException'  customize = (UnsupportedMediaTypeException <<< customize) { "message": (NullOrUndefined Nothing) }



newtype UserId = UserId String
derive instance newtypeUserId :: Newtype UserId _
derive instance repGenericUserId :: Generic UserId _
instance showUserId :: Show UserId where
  show = genericShow
instance decodeUserId :: Decode UserId where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeUserId :: Encode UserId where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }



newtype GenericAttachmentList' = GenericAttachmentList' (Array GenericAttachment)
derive instance newtypeGenericAttachmentList' :: Newtype GenericAttachmentList' _
derive instance repGenericGenericAttachmentList' :: Generic GenericAttachmentList' _
instance showGenericAttachmentList' :: Show GenericAttachmentList' where
  show = genericShow
instance decodeGenericAttachmentList' :: Decode GenericAttachmentList' where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeGenericAttachmentList' :: Encode GenericAttachmentList' where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }



newtype ListOfButtons' = ListOfButtons' (Array Button)
derive instance newtypeListOfButtons' :: Newtype ListOfButtons' _
derive instance repGenericListOfButtons' :: Generic ListOfButtons' _
instance showListOfButtons' :: Show ListOfButtons' where
  show = genericShow
instance decodeListOfButtons' :: Decode ListOfButtons' where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeListOfButtons' :: Encode ListOfButtons' where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }

