struct VeryNested {
    val: Int?;
}

struct MidNested {
    v: VeryNested?;
}

contract BreakNestedOpts {
    storage: MidNested? = null;

    init() {
        self.storage = null;
    }
}