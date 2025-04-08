contract NestedContractVars {
    foo: Int;
    bar: Bool;
    baz: NestedStruct;

    init() {
        self.foo = 10;
        self.bar = true;
        self.baz = NestedStruct{ alpha: 1, beta: false };
    }
}

struct NestedStruct {
    alpha: Int;
    beta: Bool;
}