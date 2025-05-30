struct DeepNest {
    foo: Int?;
    bar: Bool?;
}

contract TestContract {
    nested: DeepNest;

    init() {
        self.nested = DeepNest{ foo: null, bar: true };
    }
}