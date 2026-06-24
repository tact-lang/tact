contract Test {
    // Dynamic text receiver with underscore to discard parameter
    receive(_ : String) {
        // processing dynamic text messages, parameter discarded
    }
}
