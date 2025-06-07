struct NestedStructs {
    s1: Simple1;
    s2: Simple2;
}

struct Simple1 {
    a: Int;
    b: Bool;
}

struct Simple2 {
    c: String;
    d: Address;
}

contract NestedFields {
    field: NestedStructs;
    init() {
        self.field = NestedStructs{
            s1: Simple1{ a: 1, b: false },
            s2: Simple2{ c: "abc", d: myAddress() }
        };
    }
}
