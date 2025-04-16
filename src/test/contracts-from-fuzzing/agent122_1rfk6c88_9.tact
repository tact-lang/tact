contract TestWrongParamReceiver {
    // Incorrect receiver: arbitrary text message receiver should use String, not Slice
    receive(str: Slice) {
        let a = 1;
    }
}
