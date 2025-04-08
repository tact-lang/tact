struct Inner {
    foo: Int;
    bar: Bool;
    baz: String?;
}

contract NestedTest {
    myField: Inner;

    init() {
        self.myField = Inner{foo: 42, bar: true, baz: null};
    }
}