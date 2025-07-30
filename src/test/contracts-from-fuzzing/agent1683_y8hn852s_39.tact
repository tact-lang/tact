struct WithDefaults {
    a: Int = 1;
    b: String = "default";
    c: Bool = true;
}

contract ContractDefaults {
    foo: WithDefaults;

    init() {
        self.foo = WithDefaults{};
    }

    receive() {
        self.foo = WithDefaults{ a:2, b:"changed", c:false };
    }
}