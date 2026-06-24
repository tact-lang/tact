struct Complex {
    intVal: Int;
    boolVal: Bool;
    stringVal: String;
    optionalInt: Int?;
    nested: Nested;
}

struct Nested {
    flag: Bool;
    txt: String;
    optionalBool: Bool?;
    number: Int;
}

contract ManyTypesTest {
    field: Complex;

    init() {
        self.field = Complex{
            intVal: 42,
            boolVal: false,
            stringVal: "hello",
            optionalInt: 123,
            nested: Nested{
                flag: true,
                txt: "nested",
                optionalBool: null,
                number: 7,
            },
        };
    }
}
