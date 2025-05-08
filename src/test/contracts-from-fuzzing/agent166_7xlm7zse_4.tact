contract TestStringReceiver {
    receive(str: String) {
        // Simply assign the parameter to a local variable to test receiver handling
        let s: String = str;
    }
}
