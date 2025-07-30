struct DeepNested {
    a: Int;
    b: Bool?;
    c: String?;
    d: Address?;
}

contract OptionalsInside {
    my: DeepNested;

    init() {
        self.my = DeepNested{
            a: 1,
            b: null,
            c: null,
            d: null
        };
    }
}
