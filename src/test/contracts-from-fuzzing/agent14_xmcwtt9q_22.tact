struct FooAddress {
    foo: Int;
    addr: Address;
}

contract GetterWithStruct {
    foo: Int;
    init() {
        self.foo = 10;
    }
    // Getter using a struct to return multiple values
    get fun info() : FooAddress {
        let pkg = initOf GetterWithStruct();
        let computedAddr = contractAddress(pkg);
        return FooAddress{ foo: self.foo, addr: computedAddr };
    }
}
