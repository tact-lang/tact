contract TestShadowReceiverFixed {
    val: Int;

    init() {
        self.val = 0;
    }

    // Receiver function where the parameter name shadows a state variable
    receive(val: String) {
        // Accessing the contract state variable via self, while 'val' refers to the parameter
        self.val = 10;
        let localCopy = val; // use of the parameter
    }
}
