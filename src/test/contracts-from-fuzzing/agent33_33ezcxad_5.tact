contract Level3 {
    v: Int;
    init(v_: Int) { self.v = v_; }
    get fun getV(): Int { return self.v; }
}

contract Level2 {
    childAddr: Address;
    init() {
        let init3 = initOf Level3(300);
        self.childAddr = contractAddress(init3);
    }
}

contract Level1 {
    addr: Address;
    init() {
        let init2 = initOf Level2();
        self.addr = contractAddress(init2);
    }
    get fun getAddr(): Address { return self.addr; }
}
