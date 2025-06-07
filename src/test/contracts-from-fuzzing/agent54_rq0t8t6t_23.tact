struct DeepDefaulted {
    x: Int? = null;
    y: Int = 5;
    z: Bool? = true;
    s: String? = null;
}

contract DeepDefaultedContract {
    val: DeepDefaulted;

    init() {
        self.val = DeepDefaulted{};
    }
}