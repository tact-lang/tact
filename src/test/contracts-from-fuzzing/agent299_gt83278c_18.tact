struct OptionMix {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract TestContract {
    data: OptionMix;

    init() {
        self.data = OptionMix{
            a: 19,
            b: null,
            c: "text"
        };
    }
}