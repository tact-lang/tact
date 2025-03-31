// Test 4: Recursive initOf usage
// This contract recursively calls initOf on itself within a function.

contract Rec {
    // The constructor takes one parameter
    init(x: Int) {
        // No state initialization required
    }

    // Function that returns the initial state of Rec
    fun getInit(): StateInit {
         return initOf Rec(42,);
    }
}

// A simple entry point to avoid unused code warnings
contract Main {
    init() {}
    fun testRec(): StateInit {
         return initOf Rec(42,);
    }
}
