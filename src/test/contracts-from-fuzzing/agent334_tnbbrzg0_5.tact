struct DeepOptional {
    nested: Inner?;
}
struct Inner {
    foo: Bool;
}
contract Test {
    myField: DeepOptional;

    init() {
        self.myField = DeepOptional{ nested: Inner{ foo: true } };
    }
}