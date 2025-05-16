struct ZeroInitialized {
    a: Int = 0;
    b: Bool = false;
    c: String = "";
}

contract ExplicitZeroInit {
    val: ZeroInitialized;

    init() {
        self.val = ZeroInitialized{};
    }
}