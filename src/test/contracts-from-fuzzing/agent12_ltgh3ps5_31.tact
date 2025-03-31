contract ExternalReceiverTest {
    external("check") {
        // Try to access context() in an external receiver
        let ctx = context();
        // Try to access sender from the context
        let s = ctx.sender;
        acceptMessage();
    }
}
