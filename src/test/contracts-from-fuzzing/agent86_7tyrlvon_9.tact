struct NestedString {
    str: String;
    depth: Int;
}

struct MidLevel {
    nested1: NestedString;
    nested2: NestedString;
}

contract PersistComplex {
    entry: MidLevel;
    init() {
        self.entry = MidLevel{
            nested1: NestedString{str: "one", depth:1},
            nested2: NestedString{str: "two", depth:2}
        };
    }
}