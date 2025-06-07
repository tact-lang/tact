struct NestedWithDefaults {
    foo: FooWithDefault;
}

struct FooWithDefault {
    n: Int = 42;
    b: Bool = false;
}

contract ContractNestedDefaults {
    data: NestedWithDefaults;
    init() {
        self.data = NestedWithDefaults{ foo: FooWithDefault{} };
    }
}