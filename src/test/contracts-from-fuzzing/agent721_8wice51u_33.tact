struct InnerStruct {
    f1: Int;
    f2: Bool?;
}

contract PartialInit {
    s: InnerStruct;
    init() {
        self.s = InnerStruct{ f1: 4, f2: null };
    }
}