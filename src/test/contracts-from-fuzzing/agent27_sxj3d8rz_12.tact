contract NativeSendTest {
    receive() {
        // Call nativeSendMessageReturnForwardFee with an empty cell and mode 0
        let fee: Int = nativeSendMessageReturnForwardFee(beginCell().endCell(), 0);
        dump(fee);
    }
}
