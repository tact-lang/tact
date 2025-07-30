struct JustStrings {
    a: String;
    b: String;
    c: String;
}

contract StringsTest {
    foo: JustStrings;

    init() {
        self.foo = JustStrings{
            a: "x",
            b: "y",
            c: "z"
        };
    }
}