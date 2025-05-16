contract F {
    v: Int;
    init(v: Int) { self.v = v; }
    get fun getV(): Int { return self.v; }
}

contract G {
    v: Int;
    init(v: Int) { self.v = v; }
    get fun getV(): Int { return self.v; }
}

contract E {
    fAddr: Address;
    gAddr: Address;
    init() {
        let fInit = initOf F(10);
        let gInit = initOf G(20);
        self.fAddr = contractAddress(fInit);
        self.gAddr = contractAddress(gInit);
    }
    get fun getFAddress(): Address { return self.fAddr; }
    get fun getGAddress(): Address { return self.gAddr; }
}
