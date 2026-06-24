contract TestStringReceiver {
    // Test for text receiver with string parameter: receive(str: String)
    receive(str: String) {
        // Dummy check: compare string with "test"
        if (str == "test") {} 
    }

    // Include a getter to force compilation
    get fun dummy(): Int {
        return 123;
    }
}
