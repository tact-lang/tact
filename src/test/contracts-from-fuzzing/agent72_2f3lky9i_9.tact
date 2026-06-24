contract Test {
    receive() {
        // Test nativeSendMessageReturnForwardFee by invoking with a valid cell and mode
        let fee: Int = nativeSendMessageReturnForwardFee(beginCell().endCell(), 1);
        dump(fee);
    }
}
