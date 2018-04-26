
module AWS.LexRuntime.Types where

import Prelude
import Data.Foreign.Class (class Decode, class Encode)
import Data.Foreign.Generic (defaultOptions, genericDecode, genericEncode)
import Data.Foreign.Generic.Types (Options)
import Data.Generic.Rep (class Generic)
import Data.Generic.Rep.Show (genericShow)
import Data.Maybe (Maybe(..))
import Data.Newtype (class Newtype)
import Data.StrMap (StrMap) as StrMap

import AWS.Request.Types as Types

options :: Options
options = defaultOptions { unwrapSingleConstructors = true }


newtype Accept = Accept String
derive instance newtypeAccept :: Newtype Accept _
derive instance repGenericAccept :: Generic Accept _
instance showAccept :: Show Accept where show = genericShow
instance decodeAccept :: Decode Accept where decode = genericDecode options
instance encodeAccept :: Encode Accept where encode = genericEncode options



newtype AttributesString = AttributesString String
derive instance newtypeAttributesString :: Newtype AttributesString _
derive instance repGenericAttributesString :: Generic AttributesString _
instance showAttributesString :: Show AttributesString where show = genericShow
instance decodeAttributesString :: Decode AttributesString where decode = genericDecode options
instance encodeAttributesString :: Encode AttributesString where encode = genericEncode options



-- | <p>Either the Amazon Lex bot is still building, or one of the dependent services (Amazon Polly, AWS Lambda) failed with an internal service error.</p>
newtype BadGatewayException = BadGatewayException 
  { "Message" :: Maybe (ErrorMessage)
  }
derive instance newtypeBadGatewayException :: Newtype BadGatewayException _
derive instance repGenericBadGatewayException :: Generic BadGatewayException _
instance showBadGatewayException :: Show BadGatewayException where show = genericShow
instance decodeBadGatewayException :: Decode BadGatewayException where decode = genericDecode options
instance encodeBadGatewayException :: Encode BadGatewayException where encode = genericEncode options

-- | Constructs BadGatewayException from required parameters
newBadGatewayException :: BadGatewayException
newBadGatewayException  = BadGatewayException { "Message": Nothing }

-- | Constructs BadGatewayException's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newBadGatewayException' :: ( { "Message" :: Maybe (ErrorMessage) } -> {"Message" :: Maybe (ErrorMessage) } ) -> BadGatewayException
newBadGatewayException'  customize = (BadGatewayException <<< customize) { "Message": Nothing }



-- | <p> Request validation failed, there is no usable message in the context, or the bot build failed, is still in progress, or contains unbuilt changes. </p>
newtype BadRequestException = BadRequestException 
  { "message" :: Maybe (String)
  }
derive instance newtypeBadRequestException :: Newtype BadRequestException _
derive instance repGenericBadRequestException :: Generic BadRequestException _
instance showBadRequestException :: Show BadRequestException where show = genericShow
instance decodeBadRequestException :: Decode BadRequestException where decode = genericDecode options
instance encodeBadRequestException :: Encode BadRequestException where encode = genericEncode options

-- | Constructs BadRequestException from required parameters
newBadRequestException :: BadRequestException
newBadRequestException  = BadRequestException { "message": Nothing }

-- | Constructs BadRequestException's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newBadRequestException' :: ( { "message" :: Maybe (String) } -> {"message" :: Maybe (String) } ) -> BadRequestException
newBadRequestException'  customize = (BadRequestException <<< customize) { "message": Nothing }



newtype BlobStream = BlobStream String
derive instance newtypeBlobStream :: Newtype BlobStream _
derive instance repGenericBlobStream :: Generic BlobStream _
instance showBlobStream :: Show BlobStream where show = genericShow
instance decodeBlobStream :: Decode BlobStream where decode = genericDecode options
instance encodeBlobStream :: Encode BlobStream where encode = genericEncode options



newtype BotAlias = BotAlias String
derive instance newtypeBotAlias :: Newtype BotAlias _
derive instance repGenericBotAlias :: Generic BotAlias _
instance showBotAlias :: Show BotAlias where show = genericShow
instance decodeBotAlias :: Decode BotAlias where decode = genericDecode options
instance encodeBotAlias :: Encode BotAlias where encode = genericEncode options



newtype BotName = BotName String
derive instance newtypeBotName :: Newtype BotName _
derive instance repGenericBotName :: Generic BotName _
instance showBotName :: Show BotName where show = genericShow
instance decodeBotName :: Decode BotName where decode = genericDecode options
instance encodeBotName :: Encode BotName where encode = genericEncode options



-- | <p>Represents an option to be shown on the client platform (Facebook, Slack, etc.)</p>
newtype Button = Button 
  { "text" :: (ButtonTextStringWithLength)
  , "value" :: (ButtonValueStringWithLength)
  }
derive instance newtypeButton :: Newtype Button _
derive instance repGenericButton :: Generic Button _
instance showButton :: Show Button where show = genericShow
instance decodeButton :: Decode Button where decode = genericDecode options
instance encodeButton :: Encode Button where encode = genericEncode options

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
instance showButtonTextStringWithLength :: Show ButtonTextStringWithLength where show = genericShow
instance decodeButtonTextStringWithLength :: Decode ButtonTextStringWithLength where decode = genericDecode options
instance encodeButtonTextStringWithLength :: Encode ButtonTextStringWithLength where encode = genericEncode options



newtype ButtonValueStringWithLength = ButtonValueStringWithLength String
derive instance newtypeButtonValueStringWithLength :: Newtype ButtonValueStringWithLength _
derive instance repGenericButtonValueStringWithLength :: Generic ButtonValueStringWithLength _
instance showButtonValueStringWithLength :: Show ButtonValueStringWithLength where show = genericShow
instance decodeButtonValueStringWithLength :: Decode ButtonValueStringWithLength where decode = genericDecode options
instance encodeButtonValueStringWithLength :: Encode ButtonValueStringWithLength where encode = genericEncode options



-- | <p> Two clients are using the same AWS account, Amazon Lex bot, and user ID. </p>
newtype ConflictException = ConflictException 
  { "message" :: Maybe (String)
  }
derive instance newtypeConflictException :: Newtype ConflictException _
derive instance repGenericConflictException :: Generic ConflictException _
instance showConflictException :: Show ConflictException where show = genericShow
instance decodeConflictException :: Decode ConflictException where decode = genericDecode options
instance encodeConflictException :: Encode ConflictException where encode = genericEncode options

-- | Constructs ConflictException from required parameters
newConflictException :: ConflictException
newConflictException  = ConflictException { "message": Nothing }

-- | Constructs ConflictException's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newConflictException' :: ( { "message" :: Maybe (String) } -> {"message" :: Maybe (String) } ) -> ConflictException
newConflictException'  customize = (ConflictException <<< customize) { "message": Nothing }



newtype ContentType = ContentType String
derive instance newtypeContentType :: Newtype ContentType _
derive instance repGenericContentType :: Generic ContentType _
instance showContentType :: Show ContentType where show = genericShow
instance decodeContentType :: Decode ContentType where decode = genericDecode options
instance encodeContentType :: Encode ContentType where encode = genericEncode options



-- | <p> One of the dependencies, such as AWS Lambda or Amazon Polly, threw an exception. For example, </p> <ul> <li> <p>If Amazon Lex does not have sufficient permissions to call a Lambda function.</p> </li> <li> <p>If a Lambda function takes longer than 30 seconds to execute.</p> </li> <li> <p>If a fulfillment Lambda function returns a <code>Delegate</code> dialog action without removing any slot values.</p> </li> </ul>
newtype DependencyFailedException = DependencyFailedException 
  { "Message" :: Maybe (ErrorMessage)
  }
derive instance newtypeDependencyFailedException :: Newtype DependencyFailedException _
derive instance repGenericDependencyFailedException :: Generic DependencyFailedException _
instance showDependencyFailedException :: Show DependencyFailedException where show = genericShow
instance decodeDependencyFailedException :: Decode DependencyFailedException where decode = genericDecode options
instance encodeDependencyFailedException :: Encode DependencyFailedException where encode = genericEncode options

-- | Constructs DependencyFailedException from required parameters
newDependencyFailedException :: DependencyFailedException
newDependencyFailedException  = DependencyFailedException { "Message": Nothing }

-- | Constructs DependencyFailedException's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newDependencyFailedException' :: ( { "Message" :: Maybe (ErrorMessage) } -> {"Message" :: Maybe (ErrorMessage) } ) -> DependencyFailedException
newDependencyFailedException'  customize = (DependencyFailedException <<< customize) { "Message": Nothing }



newtype DialogState = DialogState String
derive instance newtypeDialogState :: Newtype DialogState _
derive instance repGenericDialogState :: Generic DialogState _
instance showDialogState :: Show DialogState where show = genericShow
instance decodeDialogState :: Decode DialogState where decode = genericDecode options
instance encodeDialogState :: Encode DialogState where encode = genericEncode options



newtype ErrorMessage = ErrorMessage String
derive instance newtypeErrorMessage :: Newtype ErrorMessage _
derive instance repGenericErrorMessage :: Generic ErrorMessage _
instance showErrorMessage :: Show ErrorMessage where show = genericShow
instance decodeErrorMessage :: Decode ErrorMessage where decode = genericDecode options
instance encodeErrorMessage :: Encode ErrorMessage where encode = genericEncode options



-- | <p>Represents an option rendered to the user when a prompt is shown. It could be an image, a button, a link, or text. </p>
newtype GenericAttachment = GenericAttachment 
  { "title" :: Maybe (StringWithLength)
  , "subTitle" :: Maybe (StringWithLength)
  , "attachmentLinkUrl" :: Maybe (StringUrlWithLength)
  , "imageUrl" :: Maybe (StringUrlWithLength)
  , "buttons" :: Maybe (ListOfButtons')
  }
derive instance newtypeGenericAttachment :: Newtype GenericAttachment _
derive instance repGenericGenericAttachment :: Generic GenericAttachment _
instance showGenericAttachment :: Show GenericAttachment where show = genericShow
instance decodeGenericAttachment :: Decode GenericAttachment where decode = genericDecode options
instance encodeGenericAttachment :: Encode GenericAttachment where encode = genericEncode options

-- | Constructs GenericAttachment from required parameters
newGenericAttachment :: GenericAttachment
newGenericAttachment  = GenericAttachment { "attachmentLinkUrl": Nothing, "buttons": Nothing, "imageUrl": Nothing, "subTitle": Nothing, "title": Nothing }

-- | Constructs GenericAttachment's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newGenericAttachment' :: ( { "title" :: Maybe (StringWithLength) , "subTitle" :: Maybe (StringWithLength) , "attachmentLinkUrl" :: Maybe (StringUrlWithLength) , "imageUrl" :: Maybe (StringUrlWithLength) , "buttons" :: Maybe (ListOfButtons') } -> {"title" :: Maybe (StringWithLength) , "subTitle" :: Maybe (StringWithLength) , "attachmentLinkUrl" :: Maybe (StringUrlWithLength) , "imageUrl" :: Maybe (StringUrlWithLength) , "buttons" :: Maybe (ListOfButtons') } ) -> GenericAttachment
newGenericAttachment'  customize = (GenericAttachment <<< customize) { "attachmentLinkUrl": Nothing, "buttons": Nothing, "imageUrl": Nothing, "subTitle": Nothing, "title": Nothing }



newtype HttpContentType = HttpContentType String
derive instance newtypeHttpContentType :: Newtype HttpContentType _
derive instance repGenericHttpContentType :: Generic HttpContentType _
instance showHttpContentType :: Show HttpContentType where show = genericShow
instance decodeHttpContentType :: Decode HttpContentType where decode = genericDecode options
instance encodeHttpContentType :: Encode HttpContentType where encode = genericEncode options



newtype IntentName = IntentName String
derive instance newtypeIntentName :: Newtype IntentName _
derive instance repGenericIntentName :: Generic IntentName _
instance showIntentName :: Show IntentName where show = genericShow
instance decodeIntentName :: Decode IntentName where decode = genericDecode options
instance encodeIntentName :: Encode IntentName where encode = genericEncode options



-- | <p>Internal service error. Retry the call.</p>
newtype InternalFailureException = InternalFailureException 
  { "message" :: Maybe (String)
  }
derive instance newtypeInternalFailureException :: Newtype InternalFailureException _
derive instance repGenericInternalFailureException :: Generic InternalFailureException _
instance showInternalFailureException :: Show InternalFailureException where show = genericShow
instance decodeInternalFailureException :: Decode InternalFailureException where decode = genericDecode options
instance encodeInternalFailureException :: Encode InternalFailureException where encode = genericEncode options

-- | Constructs InternalFailureException from required parameters
newInternalFailureException :: InternalFailureException
newInternalFailureException  = InternalFailureException { "message": Nothing }

-- | Constructs InternalFailureException's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newInternalFailureException' :: ( { "message" :: Maybe (String) } -> {"message" :: Maybe (String) } ) -> InternalFailureException
newInternalFailureException'  customize = (InternalFailureException <<< customize) { "message": Nothing }



-- | <p>Exceeded a limit.</p>
newtype LimitExceededException = LimitExceededException 
  { "retryAfterSeconds" :: Maybe (String)
  , "message" :: Maybe (String)
  }
derive instance newtypeLimitExceededException :: Newtype LimitExceededException _
derive instance repGenericLimitExceededException :: Generic LimitExceededException _
instance showLimitExceededException :: Show LimitExceededException where show = genericShow
instance decodeLimitExceededException :: Decode LimitExceededException where decode = genericDecode options
instance encodeLimitExceededException :: Encode LimitExceededException where encode = genericEncode options

-- | Constructs LimitExceededException from required parameters
newLimitExceededException :: LimitExceededException
newLimitExceededException  = LimitExceededException { "message": Nothing, "retryAfterSeconds": Nothing }

-- | Constructs LimitExceededException's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newLimitExceededException' :: ( { "retryAfterSeconds" :: Maybe (String) , "message" :: Maybe (String) } -> {"retryAfterSeconds" :: Maybe (String) , "message" :: Maybe (String) } ) -> LimitExceededException
newLimitExceededException'  customize = (LimitExceededException <<< customize) { "message": Nothing, "retryAfterSeconds": Nothing }



-- | <p>This exception is not used.</p>
newtype LoopDetectedException = LoopDetectedException 
  { "Message" :: Maybe (ErrorMessage)
  }
derive instance newtypeLoopDetectedException :: Newtype LoopDetectedException _
derive instance repGenericLoopDetectedException :: Generic LoopDetectedException _
instance showLoopDetectedException :: Show LoopDetectedException where show = genericShow
instance decodeLoopDetectedException :: Decode LoopDetectedException where decode = genericDecode options
instance encodeLoopDetectedException :: Encode LoopDetectedException where encode = genericEncode options

-- | Constructs LoopDetectedException from required parameters
newLoopDetectedException :: LoopDetectedException
newLoopDetectedException  = LoopDetectedException { "Message": Nothing }

-- | Constructs LoopDetectedException's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newLoopDetectedException' :: ( { "Message" :: Maybe (ErrorMessage) } -> {"Message" :: Maybe (ErrorMessage) } ) -> LoopDetectedException
newLoopDetectedException'  customize = (LoopDetectedException <<< customize) { "Message": Nothing }



newtype MessageFormatType = MessageFormatType String
derive instance newtypeMessageFormatType :: Newtype MessageFormatType _
derive instance repGenericMessageFormatType :: Generic MessageFormatType _
instance showMessageFormatType :: Show MessageFormatType where show = genericShow
instance decodeMessageFormatType :: Decode MessageFormatType where decode = genericDecode options
instance encodeMessageFormatType :: Encode MessageFormatType where encode = genericEncode options



-- | <p>The accept header in the request does not have a valid value.</p>
newtype NotAcceptableException = NotAcceptableException 
  { "message" :: Maybe (String)
  }
derive instance newtypeNotAcceptableException :: Newtype NotAcceptableException _
derive instance repGenericNotAcceptableException :: Generic NotAcceptableException _
instance showNotAcceptableException :: Show NotAcceptableException where show = genericShow
instance decodeNotAcceptableException :: Decode NotAcceptableException where decode = genericDecode options
instance encodeNotAcceptableException :: Encode NotAcceptableException where encode = genericEncode options

-- | Constructs NotAcceptableException from required parameters
newNotAcceptableException :: NotAcceptableException
newNotAcceptableException  = NotAcceptableException { "message": Nothing }

-- | Constructs NotAcceptableException's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newNotAcceptableException' :: ( { "message" :: Maybe (String) } -> {"message" :: Maybe (String) } ) -> NotAcceptableException
newNotAcceptableException'  customize = (NotAcceptableException <<< customize) { "message": Nothing }



-- | <p>The resource (such as the Amazon Lex bot or an alias) that is referred to is not found.</p>
newtype NotFoundException = NotFoundException 
  { "message" :: Maybe (String)
  }
derive instance newtypeNotFoundException :: Newtype NotFoundException _
derive instance repGenericNotFoundException :: Generic NotFoundException _
instance showNotFoundException :: Show NotFoundException where show = genericShow
instance decodeNotFoundException :: Decode NotFoundException where decode = genericDecode options
instance encodeNotFoundException :: Encode NotFoundException where encode = genericEncode options

-- | Constructs NotFoundException from required parameters
newNotFoundException :: NotFoundException
newNotFoundException  = NotFoundException { "message": Nothing }

-- | Constructs NotFoundException's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newNotFoundException' :: ( { "message" :: Maybe (String) } -> {"message" :: Maybe (String) } ) -> NotFoundException
newNotFoundException'  customize = (NotFoundException <<< customize) { "message": Nothing }



newtype PostContentRequest = PostContentRequest 
  { "botName" :: (BotName)
  , "botAlias" :: (BotAlias)
  , "userId" :: (UserId)
  , "sessionAttributes" :: Maybe (AttributesString)
  , "requestAttributes" :: Maybe (AttributesString)
  , "contentType" :: (HttpContentType)
  , "accept" :: Maybe (Accept)
  , "inputStream" :: (BlobStream)
  }
derive instance newtypePostContentRequest :: Newtype PostContentRequest _
derive instance repGenericPostContentRequest :: Generic PostContentRequest _
instance showPostContentRequest :: Show PostContentRequest where show = genericShow
instance decodePostContentRequest :: Decode PostContentRequest where decode = genericDecode options
instance encodePostContentRequest :: Encode PostContentRequest where encode = genericEncode options

-- | Constructs PostContentRequest from required parameters
newPostContentRequest :: BotAlias -> BotName -> HttpContentType -> BlobStream -> UserId -> PostContentRequest
newPostContentRequest _botAlias _botName _contentType _inputStream _userId = PostContentRequest { "botAlias": _botAlias, "botName": _botName, "contentType": _contentType, "inputStream": _inputStream, "userId": _userId, "accept": Nothing, "requestAttributes": Nothing, "sessionAttributes": Nothing }

-- | Constructs PostContentRequest's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newPostContentRequest' :: BotAlias -> BotName -> HttpContentType -> BlobStream -> UserId -> ( { "botName" :: (BotName) , "botAlias" :: (BotAlias) , "userId" :: (UserId) , "sessionAttributes" :: Maybe (AttributesString) , "requestAttributes" :: Maybe (AttributesString) , "contentType" :: (HttpContentType) , "accept" :: Maybe (Accept) , "inputStream" :: (BlobStream) } -> {"botName" :: (BotName) , "botAlias" :: (BotAlias) , "userId" :: (UserId) , "sessionAttributes" :: Maybe (AttributesString) , "requestAttributes" :: Maybe (AttributesString) , "contentType" :: (HttpContentType) , "accept" :: Maybe (Accept) , "inputStream" :: (BlobStream) } ) -> PostContentRequest
newPostContentRequest' _botAlias _botName _contentType _inputStream _userId customize = (PostContentRequest <<< customize) { "botAlias": _botAlias, "botName": _botName, "contentType": _contentType, "inputStream": _inputStream, "userId": _userId, "accept": Nothing, "requestAttributes": Nothing, "sessionAttributes": Nothing }



newtype PostContentResponse = PostContentResponse 
  { "contentType" :: Maybe (HttpContentType)
  , "intentName" :: Maybe (IntentName)
  , "slots" :: Maybe (String)
  , "sessionAttributes" :: Maybe (String)
  , "message" :: Maybe (Text)
  , "messageFormat" :: Maybe (MessageFormatType)
  , "dialogState" :: Maybe (DialogState)
  , "slotToElicit" :: Maybe (String)
  , "inputTranscript" :: Maybe (String)
  , "audioStream" :: Maybe (BlobStream)
  }
derive instance newtypePostContentResponse :: Newtype PostContentResponse _
derive instance repGenericPostContentResponse :: Generic PostContentResponse _
instance showPostContentResponse :: Show PostContentResponse where show = genericShow
instance decodePostContentResponse :: Decode PostContentResponse where decode = genericDecode options
instance encodePostContentResponse :: Encode PostContentResponse where encode = genericEncode options

-- | Constructs PostContentResponse from required parameters
newPostContentResponse :: PostContentResponse
newPostContentResponse  = PostContentResponse { "audioStream": Nothing, "contentType": Nothing, "dialogState": Nothing, "inputTranscript": Nothing, "intentName": Nothing, "message": Nothing, "messageFormat": Nothing, "sessionAttributes": Nothing, "slotToElicit": Nothing, "slots": Nothing }

-- | Constructs PostContentResponse's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newPostContentResponse' :: ( { "contentType" :: Maybe (HttpContentType) , "intentName" :: Maybe (IntentName) , "slots" :: Maybe (String) , "sessionAttributes" :: Maybe (String) , "message" :: Maybe (Text) , "messageFormat" :: Maybe (MessageFormatType) , "dialogState" :: Maybe (DialogState) , "slotToElicit" :: Maybe (String) , "inputTranscript" :: Maybe (String) , "audioStream" :: Maybe (BlobStream) } -> {"contentType" :: Maybe (HttpContentType) , "intentName" :: Maybe (IntentName) , "slots" :: Maybe (String) , "sessionAttributes" :: Maybe (String) , "message" :: Maybe (Text) , "messageFormat" :: Maybe (MessageFormatType) , "dialogState" :: Maybe (DialogState) , "slotToElicit" :: Maybe (String) , "inputTranscript" :: Maybe (String) , "audioStream" :: Maybe (BlobStream) } ) -> PostContentResponse
newPostContentResponse'  customize = (PostContentResponse <<< customize) { "audioStream": Nothing, "contentType": Nothing, "dialogState": Nothing, "inputTranscript": Nothing, "intentName": Nothing, "message": Nothing, "messageFormat": Nothing, "sessionAttributes": Nothing, "slotToElicit": Nothing, "slots": Nothing }



newtype PostTextRequest = PostTextRequest 
  { "botName" :: (BotName)
  , "botAlias" :: (BotAlias)
  , "userId" :: (UserId)
  , "sessionAttributes" :: Maybe (StringMap)
  , "requestAttributes" :: Maybe (StringMap)
  , "inputText" :: (Text)
  }
derive instance newtypePostTextRequest :: Newtype PostTextRequest _
derive instance repGenericPostTextRequest :: Generic PostTextRequest _
instance showPostTextRequest :: Show PostTextRequest where show = genericShow
instance decodePostTextRequest :: Decode PostTextRequest where decode = genericDecode options
instance encodePostTextRequest :: Encode PostTextRequest where encode = genericEncode options

-- | Constructs PostTextRequest from required parameters
newPostTextRequest :: BotAlias -> BotName -> Text -> UserId -> PostTextRequest
newPostTextRequest _botAlias _botName _inputText _userId = PostTextRequest { "botAlias": _botAlias, "botName": _botName, "inputText": _inputText, "userId": _userId, "requestAttributes": Nothing, "sessionAttributes": Nothing }

-- | Constructs PostTextRequest's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newPostTextRequest' :: BotAlias -> BotName -> Text -> UserId -> ( { "botName" :: (BotName) , "botAlias" :: (BotAlias) , "userId" :: (UserId) , "sessionAttributes" :: Maybe (StringMap) , "requestAttributes" :: Maybe (StringMap) , "inputText" :: (Text) } -> {"botName" :: (BotName) , "botAlias" :: (BotAlias) , "userId" :: (UserId) , "sessionAttributes" :: Maybe (StringMap) , "requestAttributes" :: Maybe (StringMap) , "inputText" :: (Text) } ) -> PostTextRequest
newPostTextRequest' _botAlias _botName _inputText _userId customize = (PostTextRequest <<< customize) { "botAlias": _botAlias, "botName": _botName, "inputText": _inputText, "userId": _userId, "requestAttributes": Nothing, "sessionAttributes": Nothing }



newtype PostTextResponse = PostTextResponse 
  { "intentName" :: Maybe (IntentName)
  , "slots" :: Maybe (StringMap)
  , "sessionAttributes" :: Maybe (StringMap)
  , "message" :: Maybe (Text)
  , "messageFormat" :: Maybe (MessageFormatType)
  , "dialogState" :: Maybe (DialogState)
  , "slotToElicit" :: Maybe (String)
  , "responseCard" :: Maybe (ResponseCard)
  }
derive instance newtypePostTextResponse :: Newtype PostTextResponse _
derive instance repGenericPostTextResponse :: Generic PostTextResponse _
instance showPostTextResponse :: Show PostTextResponse where show = genericShow
instance decodePostTextResponse :: Decode PostTextResponse where decode = genericDecode options
instance encodePostTextResponse :: Encode PostTextResponse where encode = genericEncode options

-- | Constructs PostTextResponse from required parameters
newPostTextResponse :: PostTextResponse
newPostTextResponse  = PostTextResponse { "dialogState": Nothing, "intentName": Nothing, "message": Nothing, "messageFormat": Nothing, "responseCard": Nothing, "sessionAttributes": Nothing, "slotToElicit": Nothing, "slots": Nothing }

-- | Constructs PostTextResponse's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newPostTextResponse' :: ( { "intentName" :: Maybe (IntentName) , "slots" :: Maybe (StringMap) , "sessionAttributes" :: Maybe (StringMap) , "message" :: Maybe (Text) , "messageFormat" :: Maybe (MessageFormatType) , "dialogState" :: Maybe (DialogState) , "slotToElicit" :: Maybe (String) , "responseCard" :: Maybe (ResponseCard) } -> {"intentName" :: Maybe (IntentName) , "slots" :: Maybe (StringMap) , "sessionAttributes" :: Maybe (StringMap) , "message" :: Maybe (Text) , "messageFormat" :: Maybe (MessageFormatType) , "dialogState" :: Maybe (DialogState) , "slotToElicit" :: Maybe (String) , "responseCard" :: Maybe (ResponseCard) } ) -> PostTextResponse
newPostTextResponse'  customize = (PostTextResponse <<< customize) { "dialogState": Nothing, "intentName": Nothing, "message": Nothing, "messageFormat": Nothing, "responseCard": Nothing, "sessionAttributes": Nothing, "slotToElicit": Nothing, "slots": Nothing }



-- | <p>The input speech is too long.</p>
newtype RequestTimeoutException = RequestTimeoutException 
  { "message" :: Maybe (String)
  }
derive instance newtypeRequestTimeoutException :: Newtype RequestTimeoutException _
derive instance repGenericRequestTimeoutException :: Generic RequestTimeoutException _
instance showRequestTimeoutException :: Show RequestTimeoutException where show = genericShow
instance decodeRequestTimeoutException :: Decode RequestTimeoutException where decode = genericDecode options
instance encodeRequestTimeoutException :: Encode RequestTimeoutException where encode = genericEncode options

-- | Constructs RequestTimeoutException from required parameters
newRequestTimeoutException :: RequestTimeoutException
newRequestTimeoutException  = RequestTimeoutException { "message": Nothing }

-- | Constructs RequestTimeoutException's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newRequestTimeoutException' :: ( { "message" :: Maybe (String) } -> {"message" :: Maybe (String) } ) -> RequestTimeoutException
newRequestTimeoutException'  customize = (RequestTimeoutException <<< customize) { "message": Nothing }



-- | <p>If you configure a response card when creating your bots, Amazon Lex substitutes the session attributes and slot values that are available, and then returns it. The response card can also come from a Lambda function ( <code>dialogCodeHook</code> and <code>fulfillmentActivity</code> on an intent).</p>
newtype ResponseCard = ResponseCard 
  { "version" :: Maybe (String)
  , "contentType" :: Maybe (ContentType)
  , "genericAttachments" :: Maybe (GenericAttachmentList')
  }
derive instance newtypeResponseCard :: Newtype ResponseCard _
derive instance repGenericResponseCard :: Generic ResponseCard _
instance showResponseCard :: Show ResponseCard where show = genericShow
instance decodeResponseCard :: Decode ResponseCard where decode = genericDecode options
instance encodeResponseCard :: Encode ResponseCard where encode = genericEncode options

-- | Constructs ResponseCard from required parameters
newResponseCard :: ResponseCard
newResponseCard  = ResponseCard { "contentType": Nothing, "genericAttachments": Nothing, "version": Nothing }

-- | Constructs ResponseCard's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newResponseCard' :: ( { "version" :: Maybe (String) , "contentType" :: Maybe (ContentType) , "genericAttachments" :: Maybe (GenericAttachmentList') } -> {"version" :: Maybe (String) , "contentType" :: Maybe (ContentType) , "genericAttachments" :: Maybe (GenericAttachmentList') } ) -> ResponseCard
newResponseCard'  customize = (ResponseCard <<< customize) { "contentType": Nothing, "genericAttachments": Nothing, "version": Nothing }



newtype StringMap = StringMap (StrMap.StrMap String)
derive instance newtypeStringMap :: Newtype StringMap _
derive instance repGenericStringMap :: Generic StringMap _
instance showStringMap :: Show StringMap where show = genericShow
instance decodeStringMap :: Decode StringMap where decode = genericDecode options
instance encodeStringMap :: Encode StringMap where encode = genericEncode options



newtype StringUrlWithLength = StringUrlWithLength String
derive instance newtypeStringUrlWithLength :: Newtype StringUrlWithLength _
derive instance repGenericStringUrlWithLength :: Generic StringUrlWithLength _
instance showStringUrlWithLength :: Show StringUrlWithLength where show = genericShow
instance decodeStringUrlWithLength :: Decode StringUrlWithLength where decode = genericDecode options
instance encodeStringUrlWithLength :: Encode StringUrlWithLength where encode = genericEncode options



newtype StringWithLength = StringWithLength String
derive instance newtypeStringWithLength :: Newtype StringWithLength _
derive instance repGenericStringWithLength :: Generic StringWithLength _
instance showStringWithLength :: Show StringWithLength where show = genericShow
instance decodeStringWithLength :: Decode StringWithLength where decode = genericDecode options
instance encodeStringWithLength :: Encode StringWithLength where encode = genericEncode options



newtype Text = Text String
derive instance newtypeText :: Newtype Text _
derive instance repGenericText :: Generic Text _
instance showText :: Show Text where show = genericShow
instance decodeText :: Decode Text where decode = genericDecode options
instance encodeText :: Encode Text where encode = genericEncode options



-- | <p>The Content-Type header (<code>PostContent</code> API) has an invalid value. </p>
newtype UnsupportedMediaTypeException = UnsupportedMediaTypeException 
  { "message" :: Maybe (String)
  }
derive instance newtypeUnsupportedMediaTypeException :: Newtype UnsupportedMediaTypeException _
derive instance repGenericUnsupportedMediaTypeException :: Generic UnsupportedMediaTypeException _
instance showUnsupportedMediaTypeException :: Show UnsupportedMediaTypeException where show = genericShow
instance decodeUnsupportedMediaTypeException :: Decode UnsupportedMediaTypeException where decode = genericDecode options
instance encodeUnsupportedMediaTypeException :: Encode UnsupportedMediaTypeException where encode = genericEncode options

-- | Constructs UnsupportedMediaTypeException from required parameters
newUnsupportedMediaTypeException :: UnsupportedMediaTypeException
newUnsupportedMediaTypeException  = UnsupportedMediaTypeException { "message": Nothing }

-- | Constructs UnsupportedMediaTypeException's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newUnsupportedMediaTypeException' :: ( { "message" :: Maybe (String) } -> {"message" :: Maybe (String) } ) -> UnsupportedMediaTypeException
newUnsupportedMediaTypeException'  customize = (UnsupportedMediaTypeException <<< customize) { "message": Nothing }



newtype UserId = UserId String
derive instance newtypeUserId :: Newtype UserId _
derive instance repGenericUserId :: Generic UserId _
instance showUserId :: Show UserId where show = genericShow
instance decodeUserId :: Decode UserId where decode = genericDecode options
instance encodeUserId :: Encode UserId where encode = genericEncode options



newtype GenericAttachmentList' = GenericAttachmentList' (Array GenericAttachment)
derive instance newtypeGenericAttachmentList' :: Newtype GenericAttachmentList' _
derive instance repGenericGenericAttachmentList' :: Generic GenericAttachmentList' _
instance showGenericAttachmentList' :: Show GenericAttachmentList' where show = genericShow
instance decodeGenericAttachmentList' :: Decode GenericAttachmentList' where decode = genericDecode options
instance encodeGenericAttachmentList' :: Encode GenericAttachmentList' where encode = genericEncode options



newtype ListOfButtons' = ListOfButtons' (Array Button)
derive instance newtypeListOfButtons' :: Newtype ListOfButtons' _
derive instance repGenericListOfButtons' :: Generic ListOfButtons' _
instance showListOfButtons' :: Show ListOfButtons' where show = genericShow
instance decodeListOfButtons' :: Decode ListOfButtons' where decode = genericDecode options
instance encodeListOfButtons' :: Encode ListOfButtons' where encode = genericEncode options

