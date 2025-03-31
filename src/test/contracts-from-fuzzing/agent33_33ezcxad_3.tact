contract Child {
    value: Int;
    init(v: Int) { self.value = v; }
    get fun getValue(): Int { return self.value; }
}

contract Parent {
    dummy: Int;
    init() {
        let childInit = initOf Child(123);
        let childAddr = contractAddress(childInit);
        self.dummy = 123; // dummy assignment
    }
    get fun getChildValue(): Int { return self.dummy; }
}
