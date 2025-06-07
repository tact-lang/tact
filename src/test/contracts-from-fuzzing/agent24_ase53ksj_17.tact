struct Pair { 
    first: Int;
    second: Int;
}

contract TestGetterStateModification {
    // State variable initialized to 0
    counter: Int = 0;

    // Getter function that attempts to modify the state variable 'counter'.
    // Documentation states that getters should not modify persistent state,
    // though such modifications are visible during runtime but not persisted afterward .
    get fun inc() : Int {
        self.counter = self.counter + 1;
        return self.counter;
    }

    // Regular function to read the state variable
    fun getCounter() : Int {
        return self.counter;
    }

    // Testing function that calls the getter and then reads the internal state.
    // It returns a Pair struct with the counter value before and after calling the getter.
    fun test() : Pair {
        let v1 = self.getCounter();
        let incResult = self.inc();
        let v2 = self.getCounter();
        return Pair{ first: v1, second: v2 };
    }
}
