struct SomeData {
    foo: Int;
    bar: Bool;
}

contract Test {
    data: SomeData? = null;

    init() {
        self.data = SomeData{ foo: 123, bar: true };
    }
}