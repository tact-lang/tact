struct NestedWithStringOpt {
    text: String?;
}

contract StringOptionalInner {
    n: NestedWithStringOpt;

    init() {
        self.n = NestedWithStringOpt{ text: "hi" };
    }
}
