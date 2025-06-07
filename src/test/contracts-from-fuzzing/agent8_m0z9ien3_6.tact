contract TestReturnReceiver {
    receive("test") {
        if (true) {
            return;
        }
        // extra code after return should trigger unreachable error
        return; // expecting unreachable error
    }
}
