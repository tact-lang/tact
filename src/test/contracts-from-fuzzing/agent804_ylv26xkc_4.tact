struct ComplexStruct {
    num: Int;
    flag: Bool;
    text: String;
    maybeText: String?;
    nested: NestedStruct;
}

struct NestedStruct {
    a: Int;
    b: Bool?;
    c: String;
}

contract TestContract {
    data: ComplexStruct;

    init() {
        self.data = ComplexStruct{
            num: 42,
            flag: true,
            text: "hello",
            maybeText: null,
            nested: NestedStruct{
                a: 5,
                b: true,
                c: "world",
            },
        };
    }
}
