struct Embed {
    inner: Inner;
}

struct Inner {
    x: Int;
}

contract ReorderedFields {
    data: Embed;

    init() {
        self.data = Embed{inner: Inner{x: 42}};
    }
}