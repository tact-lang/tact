struct DefaultMix {
    n: Int = 10;
    o: Int?;
    b: Bool = false;
    s: String = "hi";
}

contract DefaultMixFields {
    val: DefaultMix;

    init() {
        self.val = DefaultMix{};
    }
}
