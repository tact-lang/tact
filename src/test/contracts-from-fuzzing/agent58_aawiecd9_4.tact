contract A {
    receive() {}
}

contract TestValid {
    // This getter returns the complete initial state of contract A
    get fun test_init(): StateInit {
        // Although A has no constructor parameters, we call it with empty parentheses
        return initOf A();
    }

    // This getter returns the code cell of contract A
    get fun test_code(): Cell {
        return codeOf A;
    }

    receive() {}
}
