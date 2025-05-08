struct Inner {
    flag: Bool;
    text: String;
}

struct Wrap {
    nested: Inner;
}

contract WrapContract {
    w: Wrap;

    init() {
        self.w = Wrap{
            nested: Inner{ flag: true, text: "data" }
        };
    }
}
