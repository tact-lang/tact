contract ExternalSenderTest {
    external("test") {
        // Attempt to use sender() in an external receiver; should be unavailable
        let s = sender();
    }
}
