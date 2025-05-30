struct AAA {
    s: String;
    n: Int?;
    b: Bool;
}

contract OptionalFieldTest {
    foo: AAA;

    init() {
        self.foo = AAA{
            s: "x",
            n: null,
            b: true,
        };
    }
}