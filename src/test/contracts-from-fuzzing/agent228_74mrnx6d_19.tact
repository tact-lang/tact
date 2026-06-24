struct Complex {
    sVal: String = "default";
    flag: Bool?;
    nested: Inner?;
}

struct Inner {
    intVal: Int = 5;
    strVal: String?;
}

contract ComplexNestedOpts {
    data: Complex;

    init() {
        self.data = Complex{
            sVal: "hi",
            flag: true,
            nested: Inner{
                intVal: 10,
                strVal: "hello"
            }
        };
    }
}