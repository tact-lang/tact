/// Test case: Valid Message Struct usage

contract TestMessageValid {
    fun run() {
        // Instantiate a message struct as per [Structs and Messages] documentation
        let m: MyMsg = MyMsg{ someVal: 42 };
        dump(m.someVal);
    }
    receive() {
        self.run();
    }
}

// Message struct with opcode 123, as defined in the docs
message(123) MyMsg {
    someVal: Int as uint8;
}
