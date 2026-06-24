struct D {
    deepOpt: Int?;
}

struct C {
    optD: D?;
}

contract NestedOptFields {
    myC: C?;

    init() {
        self.myC = null;
    }
}