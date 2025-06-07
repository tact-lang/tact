contract ExternalReceiverTest {
    // External receiver with specific comment "hello" that handles external messages
    external("hello") {
        // Accept the message (external messages require explicit acceptance)
        acceptMessage();
    }
}
