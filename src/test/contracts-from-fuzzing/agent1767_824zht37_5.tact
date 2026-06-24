struct NestedOptional {
    inner: Int?;
}

struct OuterStruct {
    nested: NestedOptional?;
}

contract OptInOpt {
    f: OuterStruct;

    init() {
        self.f = OuterStruct{ nested: null };
    }
}