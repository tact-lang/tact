struct ComplexNested {
    intVal: Int;
    boolOpt: Bool?;
    stringOpt: String?;
    nestedOpt: Inner?;
}

struct Inner {
    subInt: Int;
    subFlag: Bool;
}

contract TestContract {
    complex: ComplexNested;

    init() {
        self.complex = ComplexNested{
            intVal: 5,
            boolOpt: null,
            stringOpt: "hi",
            nestedOpt: Inner{
                subInt: 12,
                subFlag: true,
            },
        };
    }
}