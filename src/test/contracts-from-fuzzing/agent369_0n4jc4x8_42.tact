struct CrossType {
    foo: Int;
    bar: Bool;
    baz: String;
    optFoo: Int?;
    optBar: Bool?;
    optBaz: String?;
}

contract CrossTypeTest {
    s: CrossType;

    init() {
        self.s = CrossType{
            foo: 1,
            bar: false,
            baz: "x",
            optFoo: null,
            optBar: null,
            optBaz: null,
        };
    }
}