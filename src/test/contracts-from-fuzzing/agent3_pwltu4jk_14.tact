struct InnerStr {
    x: Int;
    y: String;
}

contract StrAndNested {
    s: String = "outer";
    inner: InnerStr;

    init() {
        self.inner = InnerStr{
            x: 12,
            y: "inside"
        };
    }
}