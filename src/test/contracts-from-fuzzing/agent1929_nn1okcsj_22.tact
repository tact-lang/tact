struct OptsDefault {
    x: Int?;
    y: Bool?;
    z: String?;
}

contract OptDefaultsFlat {
    o1: OptsDefault;
    o2: OptsDefault?;
    init() {
        self.o1 = OptsDefault{};
        self.o2 = null;
    }
}