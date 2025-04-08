struct Complex {
    intVal: Int;
    boolVal: Bool;
    optInt: Int?;
    optBool: Bool?;
    nested: Nested2;
}

struct Nested2 {
    deepOpt: Int?;
    flag2: Bool;
}

contract MixedFieldTypes {
    data: Complex;

    init() {
        self.data = Complex{
            intVal: 42,
            boolVal: true,
            optInt: null,
            optBool: false,
            nested: Nested2{
                deepOpt: null,
                flag2: true
            }
        };
    }
}