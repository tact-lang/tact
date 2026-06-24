struct Complex {
    flag1: Bool;
    flag2: Bool;
    text: String;
    num: Int;
    optStr: String?;
    optInt: Int?;
    nested: Inner;
}

struct Inner {
    foo: Int;
    bar: Bool?;
}

contract ManyFieldsTest {
    state: Complex;

    init() {
        self.state = Complex{
            flag1: true,
            flag2: false,
            text: "hello",
            num: 42,
            optStr: null,
            optInt: 123,
            nested: Inner{ foo: 1, bar: null }
        };
    }
}