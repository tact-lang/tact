struct Nested1 {
    val: Int;
}

struct Nested2 {
    v: Nested1;
}

struct Nested3 {
    vv: Nested2;
}

contract StructDeep {
    field: Nested3;

    init() {
        self.field = Nested3{ vv: Nested2{ v: Nested1{ val: 7 } } };
    }
}