struct CombinedDeps {
    child: StateInit;
    base: StateInit;
}

contract Base {
    init(param: Int) { }
}

contract Child {
    // Uses initOf with parameter passing
    fun getBaseInit(): StateInit {
        return initOf Base(42);
    }
}

contract Parent {
    // Combines multiple dependencies: Child and Base directly
    fun combinedDependencies(): CombinedDeps {
        return CombinedDeps{ child: initOf Child(), base: initOf Base(100) };
    }

    // Checks consistency between computed address and runtime address
    get fun checkSelfAddress(): Bool {
        let s: StateInit = initOf Parent();
        let computed: Address = contractAddress(s);
        return myAddress() == computed;
    }
}

// A recursive getter example
contract RecursiveGetter {
    get fun selfState(): StateInit {
        return initOf RecursiveGetter();
    }
}

// A circular dependency example
contract CircA {
    fun getB(): StateInit {
        return initOf CircB();
    }
}

contract CircB {
    fun getA(): StateInit {
        return initOf CircA();
    }
}

// END OF CONSTRUCTED TEST SUITE
