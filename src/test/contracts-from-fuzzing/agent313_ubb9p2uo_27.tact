struct OptionStringInt {
    s: String?;
    i: Int?;
}

contract NestedOpts {
    data: OptionStringInt;

    init() {
        self.data = OptionStringInt{ s: "hi", i: null };
    }
}