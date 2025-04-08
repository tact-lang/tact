struct Complex {
    val1: Int;
    val2: String;
    optVal: Int?;
    flag: Bool;
    nested: Nested;
}

struct Nested {
    item: Int;
    optNested: Bool?;
}

contract MultiTypeFields {
    field: Complex;

    init() {
        self.field = Complex{
            val1: 5,
            val2: "hey",
            optVal: null,
            flag: true,
            nested: Nested{item: 7, optNested: false}
        };
    }
}
