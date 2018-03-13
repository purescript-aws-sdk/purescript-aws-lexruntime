## Module AWS.LexRuntime

<p>Amazon Lex provides both build and runtime endpoints. Each endpoint provides a set of operations (API). Your conversational bot uses the runtime API to understand user utterances (user input text or voice). For example, suppose a user says "I want pizza", your bot sends this input to Amazon Lex using the runtime API. Amazon Lex recognizes that the user request is for the OrderPizza intent (one of the intents defined in the bot). Then Amazon Lex engages in user conversation on behalf of the bot to elicit required information (slot values, such as pizza size and crust type), and then performs fulfillment activity (that you configured when you created the bot). You use the build-time API to create and manage your Amazon Lex bot. For a list of build-time operations, see the build-time API, . </p>

#### `postContent`

``` purescript
postContent :: forall eff. PostContentRequest -> Aff (exception :: EXCEPTION | eff) PostContentResponse
```

<p> Sends user input (text or speech) to Amazon Lex. Clients use this API to send text and audio requests to Amazon Lex at runtime. Amazon Lex interprets the user input using the machine learning model that it built for the bot. </p> <p>The <code>PostContent</code> operation supports audio input at 8kHz and 16kHz. You can use 8kHz audio to achieve higher speech recognition accuracy in telephone audio applications. </p> <p> In response, Amazon Lex returns the next message to convey to the user. Consider the following example messages: </p> <ul> <li> <p> For a user input "I would like a pizza," Amazon Lex might return a response with a message eliciting slot data (for example, <code>PizzaSize</code>): "What size pizza would you like?". </p> </li> <li> <p> After the user provides all of the pizza order information, Amazon Lex might return a response with a message to get user confirmation: "Order the pizza?". </p> </li> <li> <p> After the user replies "Yes" to the confirmation prompt, Amazon Lex might return a conclusion statement: "Thank you, your cheese pizza has been ordered.". </p> </li> </ul> <p> Not all Amazon Lex messages require a response from the user. For example, conclusion statements do not require a response. Some messages require only a yes or no response. In addition to the <code>message</code>, Amazon Lex provides additional context about the message in the response that you can use to enhance client behavior, such as displaying the appropriate client user interface. Consider the following examples: </p> <ul> <li> <p> If the message is to elicit slot data, Amazon Lex returns the following context information: </p> <ul> <li> <p> <code>x-amz-lex-dialog-state</code> header set to <code>ElicitSlot</code> </p> </li> <li> <p> <code>x-amz-lex-intent-name</code> header set to the intent name in the current context </p> </li> <li> <p> <code>x-amz-lex-slot-to-elicit</code> header set to the slot name for which the <code>message</code> is eliciting information </p> </li> <li> <p> <code>x-amz-lex-slots</code> header set to a map of slots configured for the intent with their current values </p> </li> </ul> </li> <li> <p> If the message is a confirmation prompt, the <code>x-amz-lex-dialog-state</code> header is set to <code>Confirmation</code> and the <code>x-amz-lex-slot-to-elicit</code> header is omitted. </p> </li> <li> <p> If the message is a clarification prompt configured for the intent, indicating that the user intent is not understood, the <code>x-amz-dialog-state</code> header is set to <code>ElicitIntent</code> and the <code>x-amz-slot-to-elicit</code> header is omitted. </p> </li> </ul> <p> In addition, Amazon Lex also returns your application-specific <code>sessionAttributes</code>. For more information, see <a href="http://docs.aws.amazon.com/lex/latest/dg/context-mgmt.html">Managing Conversation Context</a>. </p>

#### `postText`

``` purescript
postText :: forall eff. PostTextRequest -> Aff (exception :: EXCEPTION | eff) PostTextResponse
```

<p>Sends user input (text-only) to Amazon Lex. Client applications can use this API to send requests to Amazon Lex at runtime. Amazon Lex then interprets the user input using the machine learning model it built for the bot. </p> <p> In response, Amazon Lex returns the next <code>message</code> to convey to the user an optional <code>responseCard</code> to display. Consider the following example messages: </p> <ul> <li> <p> For a user input "I would like a pizza", Amazon Lex might return a response with a message eliciting slot data (for example, PizzaSize): "What size pizza would you like?" </p> </li> <li> <p> After the user provides all of the pizza order information, Amazon Lex might return a response with a message to obtain user confirmation "Proceed with the pizza order?". </p> </li> <li> <p> After the user replies to a confirmation prompt with a "yes", Amazon Lex might return a conclusion statement: "Thank you, your cheese pizza has been ordered.". </p> </li> </ul> <p> Not all Amazon Lex messages require a user response. For example, a conclusion statement does not require a response. Some messages require only a "yes" or "no" user response. In addition to the <code>message</code>, Amazon Lex provides additional context about the message in the response that you might use to enhance client behavior, for example, to display the appropriate client user interface. These are the <code>slotToElicit</code>, <code>dialogState</code>, <code>intentName</code>, and <code>slots</code> fields in the response. Consider the following examples: </p> <ul> <li> <p>If the message is to elicit slot data, Amazon Lex returns the following context information:</p> <ul> <li> <p> <code>dialogState</code> set to ElicitSlot </p> </li> <li> <p> <code>intentName</code> set to the intent name in the current context </p> </li> <li> <p> <code>slotToElicit</code> set to the slot name for which the <code>message</code> is eliciting information </p> </li> <li> <p> <code>slots</code> set to a map of slots, configured for the intent, with currently known values </p> </li> </ul> </li> <li> <p> If the message is a confirmation prompt, the <code>dialogState</code> is set to ConfirmIntent and <code>SlotToElicit</code> is set to null. </p> </li> <li> <p>If the message is a clarification prompt (configured for the intent) that indicates that user intent is not understood, the <code>dialogState</code> is set to ElicitIntent and <code>slotToElicit</code> is set to null. </p> </li> </ul> <p> In addition, Amazon Lex also returns your application-specific <code>sessionAttributes</code>. For more information, see <a href="http://docs.aws.amazon.com/lex/latest/dg/context-mgmt.html">Managing Conversation Context</a>. </p>

#### `Accept`

``` purescript
newtype Accept
  = Accept String
```

##### Instances
``` purescript
Newtype Accept _
Generic Accept _
Show Accept
Decode Accept
Encode Accept
```

#### `AttributesString`

``` purescript
newtype AttributesString
  = AttributesString String
```

##### Instances
``` purescript
Newtype AttributesString _
Generic AttributesString _
Show AttributesString
Decode AttributesString
Encode AttributesString
```

#### `BadGatewayException`

``` purescript
newtype BadGatewayException
  = BadGatewayException { "Message" :: NullOrUndefined (ErrorMessage) }
```

<p>Either the Amazon Lex bot is still building, or one of the dependent services (Amazon Polly, AWS Lambda) failed with an internal service error.</p>

##### Instances
``` purescript
Newtype BadGatewayException _
Generic BadGatewayException _
Show BadGatewayException
Decode BadGatewayException
Encode BadGatewayException
```

#### `newBadGatewayException`

``` purescript
newBadGatewayException :: BadGatewayException
```

Constructs BadGatewayException from required parameters

#### `newBadGatewayException'`

``` purescript
newBadGatewayException' :: ({ "Message" :: NullOrUndefined (ErrorMessage) } -> { "Message" :: NullOrUndefined (ErrorMessage) }) -> BadGatewayException
```

Constructs BadGatewayException's fields from required parameters

#### `BadRequestException`

``` purescript
newtype BadRequestException
  = BadRequestException { message :: NullOrUndefined (String) }
```

<p> Request validation failed, there is no usable message in the context, or the bot build failed, is still in progress, or contains unbuilt changes. </p>

##### Instances
``` purescript
Newtype BadRequestException _
Generic BadRequestException _
Show BadRequestException
Decode BadRequestException
Encode BadRequestException
```

#### `newBadRequestException`

``` purescript
newBadRequestException :: BadRequestException
```

Constructs BadRequestException from required parameters

#### `newBadRequestException'`

``` purescript
newBadRequestException' :: ({ message :: NullOrUndefined (String) } -> { message :: NullOrUndefined (String) }) -> BadRequestException
```

Constructs BadRequestException's fields from required parameters

#### `BlobStream`

``` purescript
newtype BlobStream
  = BlobStream String
```

##### Instances
``` purescript
Newtype BlobStream _
Generic BlobStream _
Show BlobStream
Decode BlobStream
Encode BlobStream
```

#### `BotAlias`

``` purescript
newtype BotAlias
  = BotAlias String
```

##### Instances
``` purescript
Newtype BotAlias _
Generic BotAlias _
Show BotAlias
Decode BotAlias
Encode BotAlias
```

#### `BotName`

``` purescript
newtype BotName
  = BotName String
```

##### Instances
``` purescript
Newtype BotName _
Generic BotName _
Show BotName
Decode BotName
Encode BotName
```

#### `Button`

``` purescript
newtype Button
  = Button { text :: ButtonTextStringWithLength, value :: ButtonValueStringWithLength }
```

<p>Represents an option to be shown on the client platform (Facebook, Slack, etc.)</p>

##### Instances
``` purescript
Newtype Button _
Generic Button _
Show Button
Decode Button
Encode Button
```

#### `newButton`

``` purescript
newButton :: ButtonTextStringWithLength -> ButtonValueStringWithLength -> Button
```

Constructs Button from required parameters

#### `newButton'`

``` purescript
newButton' :: ButtonTextStringWithLength -> ButtonValueStringWithLength -> ({ text :: ButtonTextStringWithLength, value :: ButtonValueStringWithLength } -> { text :: ButtonTextStringWithLength, value :: ButtonValueStringWithLength }) -> Button
```

Constructs Button's fields from required parameters

#### `ButtonTextStringWithLength`

``` purescript
newtype ButtonTextStringWithLength
  = ButtonTextStringWithLength String
```

##### Instances
``` purescript
Newtype ButtonTextStringWithLength _
Generic ButtonTextStringWithLength _
Show ButtonTextStringWithLength
Decode ButtonTextStringWithLength
Encode ButtonTextStringWithLength
```

#### `ButtonValueStringWithLength`

``` purescript
newtype ButtonValueStringWithLength
  = ButtonValueStringWithLength String
```

##### Instances
``` purescript
Newtype ButtonValueStringWithLength _
Generic ButtonValueStringWithLength _
Show ButtonValueStringWithLength
Decode ButtonValueStringWithLength
Encode ButtonValueStringWithLength
```

#### `ConflictException`

``` purescript
newtype ConflictException
  = ConflictException { message :: NullOrUndefined (String) }
```

<p> Two clients are using the same AWS account, Amazon Lex bot, and user ID. </p>

##### Instances
``` purescript
Newtype ConflictException _
Generic ConflictException _
Show ConflictException
Decode ConflictException
Encode ConflictException
```

#### `newConflictException`

``` purescript
newConflictException :: ConflictException
```

Constructs ConflictException from required parameters

#### `newConflictException'`

``` purescript
newConflictException' :: ({ message :: NullOrUndefined (String) } -> { message :: NullOrUndefined (String) }) -> ConflictException
```

Constructs ConflictException's fields from required parameters

#### `ContentType`

``` purescript
newtype ContentType
  = ContentType String
```

##### Instances
``` purescript
Newtype ContentType _
Generic ContentType _
Show ContentType
Decode ContentType
Encode ContentType
```

#### `DependencyFailedException`

``` purescript
newtype DependencyFailedException
  = DependencyFailedException { "Message" :: NullOrUndefined (ErrorMessage) }
```

<p> One of the dependencies, such as AWS Lambda or Amazon Polly, threw an exception. For example, </p> <ul> <li> <p>If Amazon Lex does not have sufficient permissions to call a Lambda function.</p> </li> <li> <p>If a Lambda function takes longer than 30 seconds to execute.</p> </li> <li> <p>If a fulfillment Lambda function returns a <code>Delegate</code> dialog action without removing any slot values.</p> </li> </ul>

##### Instances
``` purescript
Newtype DependencyFailedException _
Generic DependencyFailedException _
Show DependencyFailedException
Decode DependencyFailedException
Encode DependencyFailedException
```

#### `newDependencyFailedException`

``` purescript
newDependencyFailedException :: DependencyFailedException
```

Constructs DependencyFailedException from required parameters

#### `newDependencyFailedException'`

``` purescript
newDependencyFailedException' :: ({ "Message" :: NullOrUndefined (ErrorMessage) } -> { "Message" :: NullOrUndefined (ErrorMessage) }) -> DependencyFailedException
```

Constructs DependencyFailedException's fields from required parameters

#### `DialogState`

``` purescript
newtype DialogState
  = DialogState String
```

##### Instances
``` purescript
Newtype DialogState _
Generic DialogState _
Show DialogState
Decode DialogState
Encode DialogState
```

#### `ErrorMessage`

``` purescript
newtype ErrorMessage
  = ErrorMessage String
```

##### Instances
``` purescript
Newtype ErrorMessage _
Generic ErrorMessage _
Show ErrorMessage
Decode ErrorMessage
Encode ErrorMessage
```

#### `GenericAttachment`

``` purescript
newtype GenericAttachment
  = GenericAttachment { title :: NullOrUndefined (StringWithLength), subTitle :: NullOrUndefined (StringWithLength), attachmentLinkUrl :: NullOrUndefined (StringUrlWithLength), imageUrl :: NullOrUndefined (StringUrlWithLength), buttons :: NullOrUndefined (ListOfButtons') }
```

<p>Represents an option rendered to the user when a prompt is shown. It could be an image, a button, a link, or text. </p>

##### Instances
``` purescript
Newtype GenericAttachment _
Generic GenericAttachment _
Show GenericAttachment
Decode GenericAttachment
Encode GenericAttachment
```

#### `newGenericAttachment`

``` purescript
newGenericAttachment :: GenericAttachment
```

Constructs GenericAttachment from required parameters

#### `newGenericAttachment'`

``` purescript
newGenericAttachment' :: ({ title :: NullOrUndefined (StringWithLength), subTitle :: NullOrUndefined (StringWithLength), attachmentLinkUrl :: NullOrUndefined (StringUrlWithLength), imageUrl :: NullOrUndefined (StringUrlWithLength), buttons :: NullOrUndefined (ListOfButtons') } -> { title :: NullOrUndefined (StringWithLength), subTitle :: NullOrUndefined (StringWithLength), attachmentLinkUrl :: NullOrUndefined (StringUrlWithLength), imageUrl :: NullOrUndefined (StringUrlWithLength), buttons :: NullOrUndefined (ListOfButtons') }) -> GenericAttachment
```

Constructs GenericAttachment's fields from required parameters

#### `HttpContentType`

``` purescript
newtype HttpContentType
  = HttpContentType String
```

##### Instances
``` purescript
Newtype HttpContentType _
Generic HttpContentType _
Show HttpContentType
Decode HttpContentType
Encode HttpContentType
```

#### `IntentName`

``` purescript
newtype IntentName
  = IntentName String
```

##### Instances
``` purescript
Newtype IntentName _
Generic IntentName _
Show IntentName
Decode IntentName
Encode IntentName
```

#### `InternalFailureException`

``` purescript
newtype InternalFailureException
  = InternalFailureException { message :: NullOrUndefined (String) }
```

<p>Internal service error. Retry the call.</p>

##### Instances
``` purescript
Newtype InternalFailureException _
Generic InternalFailureException _
Show InternalFailureException
Decode InternalFailureException
Encode InternalFailureException
```

#### `newInternalFailureException`

``` purescript
newInternalFailureException :: InternalFailureException
```

Constructs InternalFailureException from required parameters

#### `newInternalFailureException'`

``` purescript
newInternalFailureException' :: ({ message :: NullOrUndefined (String) } -> { message :: NullOrUndefined (String) }) -> InternalFailureException
```

Constructs InternalFailureException's fields from required parameters

#### `LimitExceededException`

``` purescript
newtype LimitExceededException
  = LimitExceededException { retryAfterSeconds :: NullOrUndefined (String), message :: NullOrUndefined (String) }
```

<p>Exceeded a limit.</p>

##### Instances
``` purescript
Newtype LimitExceededException _
Generic LimitExceededException _
Show LimitExceededException
Decode LimitExceededException
Encode LimitExceededException
```

#### `newLimitExceededException`

``` purescript
newLimitExceededException :: LimitExceededException
```

Constructs LimitExceededException from required parameters

#### `newLimitExceededException'`

``` purescript
newLimitExceededException' :: ({ retryAfterSeconds :: NullOrUndefined (String), message :: NullOrUndefined (String) } -> { retryAfterSeconds :: NullOrUndefined (String), message :: NullOrUndefined (String) }) -> LimitExceededException
```

Constructs LimitExceededException's fields from required parameters

#### `LoopDetectedException`

``` purescript
newtype LoopDetectedException
  = LoopDetectedException { "Message" :: NullOrUndefined (ErrorMessage) }
```

<p>This exception is not used.</p>

##### Instances
``` purescript
Newtype LoopDetectedException _
Generic LoopDetectedException _
Show LoopDetectedException
Decode LoopDetectedException
Encode LoopDetectedException
```

#### `newLoopDetectedException`

``` purescript
newLoopDetectedException :: LoopDetectedException
```

Constructs LoopDetectedException from required parameters

#### `newLoopDetectedException'`

``` purescript
newLoopDetectedException' :: ({ "Message" :: NullOrUndefined (ErrorMessage) } -> { "Message" :: NullOrUndefined (ErrorMessage) }) -> LoopDetectedException
```

Constructs LoopDetectedException's fields from required parameters

#### `MessageFormatType`

``` purescript
newtype MessageFormatType
  = MessageFormatType String
```

##### Instances
``` purescript
Newtype MessageFormatType _
Generic MessageFormatType _
Show MessageFormatType
Decode MessageFormatType
Encode MessageFormatType
```

#### `NotAcceptableException`

``` purescript
newtype NotAcceptableException
  = NotAcceptableException { message :: NullOrUndefined (String) }
```

<p>The accept header in the request does not have a valid value.</p>

##### Instances
``` purescript
Newtype NotAcceptableException _
Generic NotAcceptableException _
Show NotAcceptableException
Decode NotAcceptableException
Encode NotAcceptableException
```

#### `newNotAcceptableException`

``` purescript
newNotAcceptableException :: NotAcceptableException
```

Constructs NotAcceptableException from required parameters

#### `newNotAcceptableException'`

``` purescript
newNotAcceptableException' :: ({ message :: NullOrUndefined (String) } -> { message :: NullOrUndefined (String) }) -> NotAcceptableException
```

Constructs NotAcceptableException's fields from required parameters

#### `NotFoundException`

``` purescript
newtype NotFoundException
  = NotFoundException { message :: NullOrUndefined (String) }
```

<p>The resource (such as the Amazon Lex bot or an alias) that is referred to is not found.</p>

##### Instances
``` purescript
Newtype NotFoundException _
Generic NotFoundException _
Show NotFoundException
Decode NotFoundException
Encode NotFoundException
```

#### `newNotFoundException`

``` purescript
newNotFoundException :: NotFoundException
```

Constructs NotFoundException from required parameters

#### `newNotFoundException'`

``` purescript
newNotFoundException' :: ({ message :: NullOrUndefined (String) } -> { message :: NullOrUndefined (String) }) -> NotFoundException
```

Constructs NotFoundException's fields from required parameters

#### `PostContentRequest`

``` purescript
newtype PostContentRequest
  = PostContentRequest { botName :: BotName, botAlias :: BotAlias, userId :: UserId, sessionAttributes :: NullOrUndefined (AttributesString), requestAttributes :: NullOrUndefined (AttributesString), contentType :: HttpContentType, accept :: NullOrUndefined (Accept), inputStream :: BlobStream }
```

##### Instances
``` purescript
Newtype PostContentRequest _
Generic PostContentRequest _
Show PostContentRequest
Decode PostContentRequest
Encode PostContentRequest
```

#### `newPostContentRequest`

``` purescript
newPostContentRequest :: BotAlias -> BotName -> HttpContentType -> BlobStream -> UserId -> PostContentRequest
```

Constructs PostContentRequest from required parameters

#### `newPostContentRequest'`

``` purescript
newPostContentRequest' :: BotAlias -> BotName -> HttpContentType -> BlobStream -> UserId -> ({ botName :: BotName, botAlias :: BotAlias, userId :: UserId, sessionAttributes :: NullOrUndefined (AttributesString), requestAttributes :: NullOrUndefined (AttributesString), contentType :: HttpContentType, accept :: NullOrUndefined (Accept), inputStream :: BlobStream } -> { botName :: BotName, botAlias :: BotAlias, userId :: UserId, sessionAttributes :: NullOrUndefined (AttributesString), requestAttributes :: NullOrUndefined (AttributesString), contentType :: HttpContentType, accept :: NullOrUndefined (Accept), inputStream :: BlobStream }) -> PostContentRequest
```

Constructs PostContentRequest's fields from required parameters

#### `PostContentResponse`

``` purescript
newtype PostContentResponse
  = PostContentResponse { contentType :: NullOrUndefined (HttpContentType), intentName :: NullOrUndefined (IntentName), slots :: NullOrUndefined (String), sessionAttributes :: NullOrUndefined (String), message :: NullOrUndefined (Text), messageFormat :: NullOrUndefined (MessageFormatType), dialogState :: NullOrUndefined (DialogState), slotToElicit :: NullOrUndefined (String), inputTranscript :: NullOrUndefined (String), audioStream :: NullOrUndefined (BlobStream) }
```

##### Instances
``` purescript
Newtype PostContentResponse _
Generic PostContentResponse _
Show PostContentResponse
Decode PostContentResponse
Encode PostContentResponse
```

#### `newPostContentResponse`

``` purescript
newPostContentResponse :: PostContentResponse
```

Constructs PostContentResponse from required parameters

#### `newPostContentResponse'`

``` purescript
newPostContentResponse' :: ({ contentType :: NullOrUndefined (HttpContentType), intentName :: NullOrUndefined (IntentName), slots :: NullOrUndefined (String), sessionAttributes :: NullOrUndefined (String), message :: NullOrUndefined (Text), messageFormat :: NullOrUndefined (MessageFormatType), dialogState :: NullOrUndefined (DialogState), slotToElicit :: NullOrUndefined (String), inputTranscript :: NullOrUndefined (String), audioStream :: NullOrUndefined (BlobStream) } -> { contentType :: NullOrUndefined (HttpContentType), intentName :: NullOrUndefined (IntentName), slots :: NullOrUndefined (String), sessionAttributes :: NullOrUndefined (String), message :: NullOrUndefined (Text), messageFormat :: NullOrUndefined (MessageFormatType), dialogState :: NullOrUndefined (DialogState), slotToElicit :: NullOrUndefined (String), inputTranscript :: NullOrUndefined (String), audioStream :: NullOrUndefined (BlobStream) }) -> PostContentResponse
```

Constructs PostContentResponse's fields from required parameters

#### `PostTextRequest`

``` purescript
newtype PostTextRequest
  = PostTextRequest { botName :: BotName, botAlias :: BotAlias, userId :: UserId, sessionAttributes :: NullOrUndefined (StringMap), requestAttributes :: NullOrUndefined (StringMap), inputText :: Text }
```

##### Instances
``` purescript
Newtype PostTextRequest _
Generic PostTextRequest _
Show PostTextRequest
Decode PostTextRequest
Encode PostTextRequest
```

#### `newPostTextRequest`

``` purescript
newPostTextRequest :: BotAlias -> BotName -> Text -> UserId -> PostTextRequest
```

Constructs PostTextRequest from required parameters

#### `newPostTextRequest'`

``` purescript
newPostTextRequest' :: BotAlias -> BotName -> Text -> UserId -> ({ botName :: BotName, botAlias :: BotAlias, userId :: UserId, sessionAttributes :: NullOrUndefined (StringMap), requestAttributes :: NullOrUndefined (StringMap), inputText :: Text } -> { botName :: BotName, botAlias :: BotAlias, userId :: UserId, sessionAttributes :: NullOrUndefined (StringMap), requestAttributes :: NullOrUndefined (StringMap), inputText :: Text }) -> PostTextRequest
```

Constructs PostTextRequest's fields from required parameters

#### `PostTextResponse`

``` purescript
newtype PostTextResponse
  = PostTextResponse { intentName :: NullOrUndefined (IntentName), slots :: NullOrUndefined (StringMap), sessionAttributes :: NullOrUndefined (StringMap), message :: NullOrUndefined (Text), messageFormat :: NullOrUndefined (MessageFormatType), dialogState :: NullOrUndefined (DialogState), slotToElicit :: NullOrUndefined (String), responseCard :: NullOrUndefined (ResponseCard) }
```

##### Instances
``` purescript
Newtype PostTextResponse _
Generic PostTextResponse _
Show PostTextResponse
Decode PostTextResponse
Encode PostTextResponse
```

#### `newPostTextResponse`

``` purescript
newPostTextResponse :: PostTextResponse
```

Constructs PostTextResponse from required parameters

#### `newPostTextResponse'`

``` purescript
newPostTextResponse' :: ({ intentName :: NullOrUndefined (IntentName), slots :: NullOrUndefined (StringMap), sessionAttributes :: NullOrUndefined (StringMap), message :: NullOrUndefined (Text), messageFormat :: NullOrUndefined (MessageFormatType), dialogState :: NullOrUndefined (DialogState), slotToElicit :: NullOrUndefined (String), responseCard :: NullOrUndefined (ResponseCard) } -> { intentName :: NullOrUndefined (IntentName), slots :: NullOrUndefined (StringMap), sessionAttributes :: NullOrUndefined (StringMap), message :: NullOrUndefined (Text), messageFormat :: NullOrUndefined (MessageFormatType), dialogState :: NullOrUndefined (DialogState), slotToElicit :: NullOrUndefined (String), responseCard :: NullOrUndefined (ResponseCard) }) -> PostTextResponse
```

Constructs PostTextResponse's fields from required parameters

#### `RequestTimeoutException`

``` purescript
newtype RequestTimeoutException
  = RequestTimeoutException { message :: NullOrUndefined (String) }
```

<p>The input speech is too long.</p>

##### Instances
``` purescript
Newtype RequestTimeoutException _
Generic RequestTimeoutException _
Show RequestTimeoutException
Decode RequestTimeoutException
Encode RequestTimeoutException
```

#### `newRequestTimeoutException`

``` purescript
newRequestTimeoutException :: RequestTimeoutException
```

Constructs RequestTimeoutException from required parameters

#### `newRequestTimeoutException'`

``` purescript
newRequestTimeoutException' :: ({ message :: NullOrUndefined (String) } -> { message :: NullOrUndefined (String) }) -> RequestTimeoutException
```

Constructs RequestTimeoutException's fields from required parameters

#### `ResponseCard`

``` purescript
newtype ResponseCard
  = ResponseCard { version :: NullOrUndefined (String), contentType :: NullOrUndefined (ContentType), genericAttachments :: NullOrUndefined (GenericAttachmentList') }
```

<p>If you configure a response card when creating your bots, Amazon Lex substitutes the session attributes and slot values that are available, and then returns it. The response card can also come from a Lambda function ( <code>dialogCodeHook</code> and <code>fulfillmentActivity</code> on an intent).</p>

##### Instances
``` purescript
Newtype ResponseCard _
Generic ResponseCard _
Show ResponseCard
Decode ResponseCard
Encode ResponseCard
```

#### `newResponseCard`

``` purescript
newResponseCard :: ResponseCard
```

Constructs ResponseCard from required parameters

#### `newResponseCard'`

``` purescript
newResponseCard' :: ({ version :: NullOrUndefined (String), contentType :: NullOrUndefined (ContentType), genericAttachments :: NullOrUndefined (GenericAttachmentList') } -> { version :: NullOrUndefined (String), contentType :: NullOrUndefined (ContentType), genericAttachments :: NullOrUndefined (GenericAttachmentList') }) -> ResponseCard
```

Constructs ResponseCard's fields from required parameters

#### `StringMap`

``` purescript
newtype StringMap
  = StringMap (StrMap String)
```

##### Instances
``` purescript
Newtype StringMap _
Generic StringMap _
Show StringMap
Decode StringMap
Encode StringMap
```

#### `StringUrlWithLength`

``` purescript
newtype StringUrlWithLength
  = StringUrlWithLength String
```

##### Instances
``` purescript
Newtype StringUrlWithLength _
Generic StringUrlWithLength _
Show StringUrlWithLength
Decode StringUrlWithLength
Encode StringUrlWithLength
```

#### `StringWithLength`

``` purescript
newtype StringWithLength
  = StringWithLength String
```

##### Instances
``` purescript
Newtype StringWithLength _
Generic StringWithLength _
Show StringWithLength
Decode StringWithLength
Encode StringWithLength
```

#### `Text`

``` purescript
newtype Text
  = Text String
```

##### Instances
``` purescript
Newtype Text _
Generic Text _
Show Text
Decode Text
Encode Text
```

#### `UnsupportedMediaTypeException`

``` purescript
newtype UnsupportedMediaTypeException
  = UnsupportedMediaTypeException { message :: NullOrUndefined (String) }
```

<p>The Content-Type header (<code>PostContent</code> API) has an invalid value. </p>

##### Instances
``` purescript
Newtype UnsupportedMediaTypeException _
Generic UnsupportedMediaTypeException _
Show UnsupportedMediaTypeException
Decode UnsupportedMediaTypeException
Encode UnsupportedMediaTypeException
```

#### `newUnsupportedMediaTypeException`

``` purescript
newUnsupportedMediaTypeException :: UnsupportedMediaTypeException
```

Constructs UnsupportedMediaTypeException from required parameters

#### `newUnsupportedMediaTypeException'`

``` purescript
newUnsupportedMediaTypeException' :: ({ message :: NullOrUndefined (String) } -> { message :: NullOrUndefined (String) }) -> UnsupportedMediaTypeException
```

Constructs UnsupportedMediaTypeException's fields from required parameters

#### `UserId`

``` purescript
newtype UserId
  = UserId String
```

##### Instances
``` purescript
Newtype UserId _
Generic UserId _
Show UserId
Decode UserId
Encode UserId
```

#### `GenericAttachmentList'`

``` purescript
newtype GenericAttachmentList'
  = GenericAttachmentList' (Array GenericAttachment)
```

##### Instances
``` purescript
Newtype GenericAttachmentList' _
Generic GenericAttachmentList' _
Show GenericAttachmentList'
Decode GenericAttachmentList'
Encode GenericAttachmentList'
```

#### `ListOfButtons'`

``` purescript
newtype ListOfButtons'
  = ListOfButtons' (Array Button)
```

##### Instances
``` purescript
Newtype ListOfButtons' _
Generic ListOfButtons' _
Show ListOfButtons'
Decode ListOfButtons'
Encode ListOfButtons'
```


