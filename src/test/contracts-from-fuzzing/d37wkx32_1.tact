fun test() : Int {
    return 42;
}

// Invoke the function to test it in a minimal contract context
contract TestContract {
    get fun getTest() : Int {
        return test();
    }
}
