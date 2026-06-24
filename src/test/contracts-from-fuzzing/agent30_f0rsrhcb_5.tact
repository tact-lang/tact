contract A {
    init() {}
}

contract B {
    fun getAInit(): StateInit {
        // Simple cross-contract initialization
        return initOf A();
    }

    receive() {
        // Using initOf inside a receiver
        let s = initOf A();
    }
}

contract C {
    fun getBInit(): StateInit {
        // Multi-level call: contract C referencing B, which references A
        return initOf B();
    }
}

contract R {
    // Recursive initialization: the contract R computes its own state init
    fun recInit(): StateInit {
         return initOf R();
    }
}

// Circular dependency between two contracts X and Y
contract X {
    fun initY(): StateInit {
         return initOf Y();
    }
}

contract Y {
    fun initX(): StateInit {
         return initOf X();
    }
}

// Multi-level nested dependencies
contract Nest3 {
    init() {}
}

contract Nest2 {
    fun getNest3(): StateInit {
        return initOf Nest3();
    }
}

contract Nest1 {
    fun getNest2(): StateInit {
        return initOf Nest2();
    }
}

// Multiple initOf usage within a single function
contract U {
    init() {}
}

contract V {
    init() {}
}

contract MultiInit {
    fun getBoth(): Int {
         let a = initOf U();
         let b = initOf V();
         return 1;
    }
}
