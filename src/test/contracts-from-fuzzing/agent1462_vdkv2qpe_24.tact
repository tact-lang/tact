// nested struct inside optional inside struct
struct InnerNest {
    a: Int;
}

struct MidNest {
    i: InnerNest;
    flag: Bool;
}

struct OuterWrap {
    m: MidNest?;
}

contract NestedOptionalWrap {
    field: OuterWrap;

    init() {
        self.field = OuterWrap{ m: null };
    }
}