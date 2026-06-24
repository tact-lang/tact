contract TestContract {
    complex: ComplexStruct;

    init() {
        self.complex = ComplexStruct{
            s: "Hello",
            n: 123,
            flag: true,
            optInt: null,
            nested: SubStruct{
                x: 1,
                y: 2
            }
        };
    }
}

struct ComplexStruct {
    s: String;
    n: Int;
    flag: Bool;
    optInt: Int?;
    nested: SubStruct;
}

struct SubStruct {
    x: Int;
    y: Int;
}
