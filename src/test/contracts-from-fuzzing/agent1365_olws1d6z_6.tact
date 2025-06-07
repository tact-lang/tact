struct InnerX {
    flag: Bool;
    text: String;
}

struct OuterX {
    inner: InnerX;
    num: Int;
}

contract OptionalNested {
    data: OuterX?;

    init() {
        self.data = null;
    }
}