struct Inner {
    flag: Bool;
    txt: String?;
}

struct Middle {
    inner: Inner?;
    number: Int?;
}

struct Outermost {
    middle: Middle?;
    text: String;
}

contract OptionalDeep {
    field: Outermost;

    init() {
        self.field = Outermost{
            middle: null,
            text: "hi",
        };
    }
}
