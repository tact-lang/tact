// optional struct vs optional primitives juxtaposed
struct Data {
    f1: Int;
    f2: Bool;
}

contract OptVsPrim {
    sopt: Data?;
    iopt: Int?;
    bopt: Bool?;

    init() {
        self.sopt = Data{ f1: 1, f2: false };
        self.iopt = null;
        self.bopt = true;
    }
}
