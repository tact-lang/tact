struct DeeplyOptional {
    aa: Int?;
    bb: Bool?;
    cc: String?;
}

contract OptionalLots {
    a: Int?;
    b: Bool?;
    c: String?;
    d: DeeplyOptional?;

    init() {
        self.a = null;
        self.b = null;
        self.c = null;
        self.d = null;
    }
}