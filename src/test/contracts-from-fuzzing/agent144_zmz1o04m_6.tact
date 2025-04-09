struct Inner {
    a: Int?;
    b: Bool?;
}

struct Middle {
    inner: Inner?;
    text: String?;
}

contract OptionalNested {
    storage: Middle?;

    init() {
        self.storage = Middle{
            inner: Inner{
                a: null,
                b: null,
            },
            text: null,
        };
    }
}