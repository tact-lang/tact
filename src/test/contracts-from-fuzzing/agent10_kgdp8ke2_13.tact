message Dummy {}

contract TestNestedReturn {
    v: Int = 0; // initialize state variable
    
    // Function with nested block return
    fun nestedReturn(x: Int): Int {
        {
            if (x == 0) { return 1; }
        }
        return 2;
    }

    // Getter with nested block return
    get fun nestedGetter(): Int {
        {
            if (self.v == 0) { return 100; }
        }
        return self.v;
    }
    
    // Receiver function with nested block return
    receive (msg: Dummy) {
        { return; }
    }
}
