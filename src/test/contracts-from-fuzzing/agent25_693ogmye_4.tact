contract Self {
    // Self-recursive initOf usage
    fun selfInit() : StateInit {
        return initOf Self();
    }
}

contract A {
    // Retrieves the initial state of contract B
    fun getBInit() : StateInit {
        return initOf B();
    }
}

contract B {
    // Retrieves the initial state of contract C
    fun getCInit() : StateInit {
        return initOf C();
    }
}

contract C {
    // Retrieves the initial state of contract D
    fun getDInit() : StateInit {
        return initOf D();
    }
}

contract D {
    // Retrieves the initial state of contract A, closing a cyclic dependency
    fun getAInit() : StateInit {
        return initOf A();
    }
}

// Parameterized contract with contract parameters syntax
contract ParamContract(param: Int) {}

contract Tester {
    // Uses initOf with parameters
    fun testParam() : StateInit {
        return initOf ParamContract(42);
    }
}
