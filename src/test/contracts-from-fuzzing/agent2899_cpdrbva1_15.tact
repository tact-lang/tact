struct MultiOpt {
    i: Int?;
    b: Bool?;
    a: Address?;
}

contract StructOfOpts {
    f: MultiOpt;

    init() {
        self.f = MultiOpt{ i: null, b: null, a: null };
    }
}
