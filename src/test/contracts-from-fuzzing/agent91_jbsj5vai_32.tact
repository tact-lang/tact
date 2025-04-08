struct ContainingString {
    text: String;
    flag: Bool;
}

struct TopLevelMix {
    inner: ContainingString;
    num: Int;
}

contract StructWithStringNest {
    data: TopLevelMix;

    init() {
        self.data = TopLevelMix{
            inner: ContainingString{ text: "abc", flag: true },
            num: 10
        };
    }
}
