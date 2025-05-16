struct Capsule {
    nested: Int;
    txt: String;
}

struct Boxed {
    inner: Capsule;
    flag: Bool;
}

contract DeepEmbedded {
    box: Boxed;

    init() {
        self.box = Boxed{
            inner: Capsule{ nested: 99, txt: "hello" },
            flag: true,
        };
    }
}