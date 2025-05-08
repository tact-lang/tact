contract A {
    init() {}
    receive() {}
}

contract B {
    // Uses contract A's init package
    inline fun getAInit() : StateInit {
        return initOf A();
    }
    init() {}
    receive() {}
}

contract C {
    init() {}
    receive() {}
}

contract GraphContract {
    receive() {
        // Compute initialization packages from B and C
        let initB = initOf B();
        // As initB is simply StateInit, we separately call initOf A()
        let a_init = initOf A();
        let initC = initOf C();
        // Compute addresses
        let addrA = contractAddress(a_init);
        let addrC = contractAddress(initC);
        require(addrA != addrC, "Addresses (A and C) should differ");
    }
}
