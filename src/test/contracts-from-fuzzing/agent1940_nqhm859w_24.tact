struct InnerS {
    optI: Int?;
}

contract OptStruct {
    x: InnerS?;

    init() {
        self.x = InnerS{ optI:42 };
    }
}