struct Inner {
    num: Int;
    text: String;
}

contract OptionalStructInit {
    f: Inner?;

    init() {
        self.f = Inner { num: 42, text: "hi" };
    }
}
