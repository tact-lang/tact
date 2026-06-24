struct Nested {
    n1: Int;
    n2: Bool;
}

contract DeepOptionals {
    nestedOpt: Nested?;
    iopt: Int?;
    bopt: Bool?;
    sopt: String?;

    init() {
        self.nestedOpt = null;
        self.iopt = null;
        self.bopt = null;
        self.sopt = null;
    }
}