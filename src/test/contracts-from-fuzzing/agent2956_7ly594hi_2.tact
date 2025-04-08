struct Complex {
    text: String;
    num: Int;
    optBool: Bool?;
    nested: Nested;
}

struct Nested {
    innerStr: String?;
    innerInt: Int;
}

contract TestContract {
    complexField: Complex;
    flag: Bool;
    count: Int;
    optCount: Int?;

    init() {
        self.complexField = Complex{
            text: "abc",
            num: 5,
            optBool: null,
            nested: Nested{
                innerStr: null,
                innerInt: 10,
            },
        };
        self.flag = false;
        self.count = 42;
        self.optCount = null;
    }
}