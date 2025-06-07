message(1) TestMsg {}

contract TestReceivers {
    // Text receiver
    receive("textReceiver") {
        // Normally, text receiver logic
    }
    
    // Binary receiver using a message
    receive(_: TestMsg) {
        // Binary receiver logic
    }

    // Internal function within the contract accessing state variable
    counter: Int;

    init() {
        self.counter = 0;
    }

    // Internal function (not a getter) modifying state
    fun increment() {
        self.counter += 1;
    }

    // Getter function reading state variable
    get fun getCounter(): Int {
        // Even though we attempt modifying, this change won't persist.
        self.counter += 100;
        return self.counter;
    }
}
