contract Level1 {
    init() {}
    receive() {}
}

contract Level2 {
    init() {
        // Initialization depends on Level1
        let addrL1 = contractAddress(initOf Level1());
    }
    receive() {}
}

contract Level3 {
    init() {
        // Initialization depends on Level2
        let addrL2 = contractAddress(initOf Level2());
    }
    receive() {}
}

contract Level4 {
    init() {
        // Initialization depends on Level3
        let addrL3 = contractAddress(initOf Level3());
    }
    receive() {}
}

contract Level5 {
    receive() {
        // Deep dependency: Level5 depends on Level4 which in turn depends on Level3, Level2, and Level1
        let addrL4 = contractAddress(initOf Level4());
        require(addrL4 == contractAddress(initOf Level4()), "Deep dependency chain failed");
    }
}
