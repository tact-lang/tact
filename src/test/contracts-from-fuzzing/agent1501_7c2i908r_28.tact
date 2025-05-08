struct SomeData {
    a: Int;
    b: Bool;
}

contract TestContract {
    foo: SomeData?;

    init() {
        self.foo = SomeData{ a: 5, b: true };
    }
}