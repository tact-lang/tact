contract StoreUintEdge {
    receive() {
        let c = beginCell().storeUint(123, 0).endCell();
        let s = c.beginParse();
        dump(s.loadUint(0)); // Edge-case: storing 123 with 0 bits
    }
}
