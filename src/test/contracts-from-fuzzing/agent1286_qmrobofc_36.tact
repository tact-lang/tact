struct Composed {
    val: Int as uint32;
    opt: Bool?;
    text: String;
}

contract ComposeSerialize {
    s: Composed;

    init() {
        self.s = Composed{ val: 42, opt: null, text: "abc" };
    }
}