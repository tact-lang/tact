struct OptNested {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract OptionDeep {
    data: OptNested;

    init() {
        self.data = OptNested{
            a: null,
            b: null,
            c: null
        };
    }
}