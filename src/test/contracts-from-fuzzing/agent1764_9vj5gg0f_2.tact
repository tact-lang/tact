struct Inner {
    num: Int?;
    flag: Bool?;
    text: String?;
}

contract TestContract {
    composite: Inner;

    init() {
        self.composite = Inner{ num: 42, flag: true, text: "hi" };
    }
}
