// nested structs inside optional contract field
struct NestedS {
    z: Int = 42;
}

struct Wrap {
    ns: NestedS;
}

contract OptionalNested {
    w: Wrap? = null;
    init() {
        self.w = Wrap{ ns: NestedS{} };
    }
}