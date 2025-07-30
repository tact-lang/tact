struct Mixed {
    intVal: Int;
    boolVal: Bool;
    stringVal: String;
    optionalVal: Int?;
    nested: Nested;
}

struct Nested {
    a: Bool;
    b: String;
    c: Int;
}

contract MixedFields {
    content: Mixed;

    init() {
        self.content = Mixed{
            intVal: 1,
            boolVal: true,
            stringVal: "test",
            optionalVal: null,
            nested: Nested{
                a: false,
                b: "nested",
                c: 10
            }
        };
    }
}