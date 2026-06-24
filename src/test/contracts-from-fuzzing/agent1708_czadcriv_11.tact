struct MixOfScalarAndNested {
    intVal: Int;
    boolVal: Bool;
    nested: Nested;
}

struct Nested {
    nestedInt: Int;
    nestedBool: Bool?;
    nestedString: String;
}

contract TestContract {
    s: MixOfScalarAndNested;

    init() {
        self.s = MixOfScalarAndNested{
            intVal: 7,
            boolVal: true,
            nested: Nested{
                nestedInt: 8,
                nestedBool: null,
                nestedString: "text"
            }
        };
    }
}