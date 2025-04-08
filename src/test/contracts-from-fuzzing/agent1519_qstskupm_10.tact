struct AllOpt {
    a: Int?;
    b: Bool?;
    c: Address?;
}

contract TestAllOptionals {
    data: AllOpt = AllOpt{};

    init() {
        self.data = AllOpt{
            a: null,
            b: null,
            c: null
        };
    }
}