contract Level4 {
    init() {
        // Base contract with no dependencies
    }
}

contract Level3 {
    init() {
        // Level3 initializes Level4
        let l4 = initOf Level4();
        let addrL4 = contractAddress(l4);
    }
}

contract Level2 {
    init() {
        // Level2 initializes Level3
        let l3 = initOf Level3();
        let addrL3 = contractAddress(l3);
    }
}

contract Level1 {
    init() {
        // Level1 initializes Level2
        let l2 = initOf Level2();
        let addrL2 = contractAddress(l2);
    }
}
