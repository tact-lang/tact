struct InnerString {
    s1: String;
    s2: String;
}

struct HasDefaultInner {
    inner: InnerString = InnerString{s1: "x", s2: "y"};
}

contract Test27 {
    data: HasDefaultInner;

    init() {
        self.data = HasDefaultInner{};
    }
}