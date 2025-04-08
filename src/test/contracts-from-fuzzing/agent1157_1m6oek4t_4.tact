struct Complex {
    n: Int;
    flag: Bool;
    comment: String;
    maybeZ: Int?;
    nested: Nested;
}

struct Nested {
    foo: Bool;
}

contract MixedComplexTest {
    complexVal: Complex;

    init() {
        self.complexVal = Complex{
            n: 123,
            flag: true,
            comment: "hello",
            maybeZ: null,
            nested: Nested{ foo: false }
        };
    }

    receive() {
        let tmp = self.complexVal;
    }
}