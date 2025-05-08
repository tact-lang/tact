struct TopInner {
    maybeVal: Int?; // optional, no explicit default
}

struct Top {
    text: String;
    nested: TopInner;
}

contract ImplicitNullTest {
    data: Top;

    init() {
        self.data = Top{
            text: "hi",
            nested: TopInner{},
        };
    }
}