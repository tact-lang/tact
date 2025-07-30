// deeply nested struct tree with multi optional
struct DeepA {
    v: Int?;
}

struct DeepB {
    a: DeepA?;
}

struct DeepC {
    b: DeepB?;
}

struct DeepD {
    c: DeepC?;
}

contract OptionalForest {
    d: DeepD;
    init() {
        self.d = DeepD{ c:null };
    }
}