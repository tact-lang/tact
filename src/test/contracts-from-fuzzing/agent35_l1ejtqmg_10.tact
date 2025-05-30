message MyMsg {
    value: Int as uint64;
}

contract BounceActionFixed {
    counter: Int;

    init() {
        self.counter = 0;
    }

    // Bounce receiver using a smaller integer type for 'value' to fit into 224 bits
    bounced(msg: bounced<MyMsg>) {
        self.counter += msg.value;
        self.notify("Bounce handled".asComment());
    }

    // A receive function that always fails, causing a bounce
    receive(msg: MyMsg) {
        require(false, "Simulate bounce");
    }
}
