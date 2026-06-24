struct Complex {
    intVal: Int;
    optInt: Int?;
    strVal: String;
    boolVal: Bool;
    nested: Nested;
}

struct Nested {
    x: Int;
    flag: Bool;
}

contract ComplexFields {
    data: Complex;

    init() {
        self.data = Complex{
            intVal: 1,
            optInt: null,
            strVal: "str",
            boolVal: true,
            nested: Nested{
                x:99,
                flag:false
            }
        };
    }
}