contract C {
    a: Int;
    init(a_: Int) { self.a = a_; }
    get fun getA(): Int { return self.a; }
}

contract D {
    a: Int;
    cAddr: Address;
    init(a_: Int) {
        self.a = a_;
        // Using initOf with a trailing comma and an expression
        let cInit = initOf C(a_ + 10,);
        self.cAddr = contractAddress(cInit);
    }
    get fun getA(): Int { return self.a; }
}
