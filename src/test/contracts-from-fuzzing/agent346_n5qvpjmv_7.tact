struct Complex {
    intVal: Int;
    boolVal: Bool;
    optionalInt: Int?;
    optionalBool: Bool?;
    nested: Nested;
}

struct Nested {
    field1: Int;
    field2: Bool;
}

contract CombinedTypes {
    data: Complex;

    init() {
        self.data = Complex{
            intVal: 1,
            boolVal: true,
            optionalInt: null,
            optionalBool: false,
            nested: Nested{
                field1: 10,
                field2: true
            }
        };
    }
}