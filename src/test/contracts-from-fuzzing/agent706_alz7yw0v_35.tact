struct MixDefaults {
    a: Int = 5;
    b: Bool = false;
    c: String = "hi";
}

contract TestContract {
    val: MixDefaults;

    init() {
        self.val = MixDefaults{};
    }
}