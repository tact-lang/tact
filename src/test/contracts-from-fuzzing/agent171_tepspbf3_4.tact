contract Test {
    // receiver with parameter of type String
    receive(msg: String) {
        let localText: String = msg;
    }
}
