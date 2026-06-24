contract CircA {
    // Inline function referencing the init package of CircB
    inline fun getBInit() : StateInit {
        return initOf CircB();
    }
    receive() {
        // No operation in receiver
    }
}

contract CircB {
    // Inline function referencing the init package of CircA
    inline fun getAInit() : StateInit {
        return initOf CircA();
    }
    receive() {
        // Compute both init packages to ensure circular references are handled without immediate recursion
        let a_init = initOf CircA();
        let b_init = initOf CircB();
        // Compute addresses
        let addrA = contractAddress(a_init);
        let addrB = contractAddress(b_init);
        require(addrA != addrB, "Circular inline dependency produced identical addresses");
    }
}
