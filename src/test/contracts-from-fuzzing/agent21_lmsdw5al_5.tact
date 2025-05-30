/// Deep nested contract graph testing multiple levels of initOf and contractAddress

contract Level4 {
    init() {}
    receive() {}
}

contract Level3 {
    init() {}
    receive() {
         let s = initOf Level4();
         let addr = contractAddress(s);
    }
}

contract Level2 {
    init() {}
    receive() {
         let s = initOf Level3();
         let addr = contractAddress(s);
    }
}

contract Level1 {
    init() {}
    receive() {
         let s = initOf Level2();
         let addr = contractAddress(s);
    }
}

contract Level0 {
    init() {}
    receive() {
         let s = initOf Level1();
         let addr = contractAddress(s);
    }
}
