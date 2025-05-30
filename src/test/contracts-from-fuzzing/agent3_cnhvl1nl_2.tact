contract TestNativeSend() {
    receive() {
        let comment = "native test".asComment();
        nativeSendMessage(comment, SendRemainingValue);
        let fee: Int = nativeSendMessageReturnForwardFee(comment, SendRemainingValue);
    }
}
