struct DeepNested {
    number: Int;
    flag: Bool;
    text: String;
    child: InnerStruct;
}

struct InnerStruct {
    a: Int;
    b: String;
    c: Bool;
}

contract ContractWithDeepNested {
    nested: DeepNested;

    init() {
        self.nested = DeepNested{
            number: 1,
            flag: true,
            text: "test",
            child: InnerStruct{
                a: 2,
                b: "inner",
                c: false
            }
        };
    }
}