struct NestedStringOpt {
    strOpt: String?;
}

struct Container {
    nested: NestedStringOpt;
}

contract OptWithinStruct {
    rec: Container;

    init() {
        self.rec = Container{ nested: NestedStringOpt{ strOpt: null } };
    }
}