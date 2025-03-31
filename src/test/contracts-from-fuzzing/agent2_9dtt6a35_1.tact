contract ContractB {
    init() {
    }
}

contract ContractA {
    receive() {
         let s = initOf ContractB();
         // Just use s to force its computation
         s.code;
         s.data;
    }
}
