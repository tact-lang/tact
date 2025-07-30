struct DeepDefaults {
    a: Int = 1;
    b: Bool = false;
    c: String = "test";
}

contract StructDefaultInit {
    data: DeepDefaults;

    init() {
        self.data = DeepDefaults{};
    }
}
