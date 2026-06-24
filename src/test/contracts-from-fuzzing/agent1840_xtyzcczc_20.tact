struct DeepDefOpt {
    a: Int? = null;
    b: Bool? = true;
    c: String? = null;
}

contract DeepDefault {
    val: DeepDefOpt;

    init() {
        self.val = DeepDefOpt{};
    }
}