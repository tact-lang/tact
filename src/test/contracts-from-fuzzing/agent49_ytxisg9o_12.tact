contract Test {
    // Text receiver with parameter name different from 'str'
    receive(msg: String) {
        // This should compile as a valid arbitrary text message receiver
    }
}
