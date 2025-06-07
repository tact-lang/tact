struct Inner {
    a: Int;
    b: Bool;
    c: String;
}

contract NestedTest {
    innerField: Inner;

    init() {
        self.innerField = Inner{
            a: 1,
            b: false,
            c: "hi",
        };
    }
}