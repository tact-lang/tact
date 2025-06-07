struct Inner {
    z: Int?;
    b: Bool?;
}

struct Middle {
    text: String;
    inner: Inner?;
}

contract DeepOptionals {
    st: Middle?;

    init() {
        self.st = Middle{
            text: "hi",
            inner: null,
        };
    }
}