struct Complex {
    nested: NestedStruct;
    optNested: NestedStruct?;
}

struct NestedStruct {
    flag: Bool;
    value: Int;
    str: String;
    optBool: Bool?;
    optInt: Int?;
    optStr: String?;
}

contract CTest {
    storage: Complex;

    init() {
        self.storage = Complex{
            nested: NestedStruct{
                flag: true,
                value: 100,
                str: "abc",
                optBool: false,
                optInt: 50,
                optStr: "hi",
            },
            optNested: null,
        };
    }
}