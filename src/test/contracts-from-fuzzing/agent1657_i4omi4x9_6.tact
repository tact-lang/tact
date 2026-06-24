struct DeepOpt {
    inner: InnerOpt;
}

struct InnerOpt {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract Test {
    structField: DeepOpt;

    init() {
        self.structField = DeepOpt{ inner: InnerOpt{ a: null, b: null, c: null } };
    }
}