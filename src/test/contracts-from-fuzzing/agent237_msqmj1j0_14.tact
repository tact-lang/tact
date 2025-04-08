struct OuterOpt {
    nested: IntDefaults?;
}

struct IntDefaults {
    a: Int = 1;
    b: Int = 2;
    c: Int = 3;
}

contract OptStructInStruct {
    store: OuterOpt;
    init() {
        self.store = OuterOpt{nested: null};
    }
}