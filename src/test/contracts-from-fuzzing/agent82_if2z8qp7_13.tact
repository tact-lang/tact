struct OptionTuple {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract Test {
    data: OptionTuple;

    init() {
        self.data = OptionTuple{
            a: 1,
            b: null,
            c: null
        };
    }
}