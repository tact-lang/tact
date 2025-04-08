struct DeepNestedOpt {
    f1: InnerA?;
}

struct InnerA {
    f2: InnerB?;
}

struct InnerB {
    f3: InnerC?;
}

struct InnerC {
    x: Int;
}

contract C {
    store: DeepNestedOpt;

    init() {
        self.store = DeepNestedOpt{ f1: null };
    }
}