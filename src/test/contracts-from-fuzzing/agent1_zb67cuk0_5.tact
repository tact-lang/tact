/*
   Snippet 1: Deep multi-level nested dependency chain
   L1 -> L2 -> L3 -> L4; Root uses initOf L4 to trigger full chain.
*/

contract L1 {
    init() {}
    receive() {}
}

contract L2 {
    init() {
        let s1: StateInit = initOf L1();
    }
    receive() {}
}

contract L3 {
    init() {
        let s2: StateInit = initOf L2();
    }
    receive() {}
}

contract L4 {
    init() {
        let s3: StateInit = initOf L3();
    }
    receive() {}
}

contract Root {
    receive() {
        let s: StateInit = initOf L4();
        self.reply("Chain OK".asComment());
    }
}
