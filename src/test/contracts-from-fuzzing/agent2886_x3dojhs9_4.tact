struct StructA {
    num: Int;
    flag: Bool;
}

struct StructB {
    message: String;
    nested: StructA;
    optionalFlag: Bool?;
}

contract DeepNestedOptional {
    data: StructB;
    init() {
        self.data = StructB{
            message: "Hello",
            nested: StructA{ num: 5, flag: false },
            optionalFlag: null
        };
    }
}