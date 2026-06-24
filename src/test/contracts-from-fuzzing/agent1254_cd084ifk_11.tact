struct StrucOfStructs {
    first: Inner1;
    second: Inner2;
}

struct Inner1 {
    field1: Int;
    field2: String?;
}

struct Inner2 {
    flag: Bool;
    val: Int?;
}

contract StructFields {
    s: StrucOfStructs;

    init() {
        self.s = StrucOfStructs{
            first: Inner1{ field1: 5, field2: null },
            second: Inner2{ flag: true, val: null }
        };
    }
}