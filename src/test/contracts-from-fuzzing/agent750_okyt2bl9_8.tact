struct Defaulted {
    d1: Int = 42;
    d2: String = "default";
}

contract DefaultsInStorage {
    val: Defaulted;

    init() {
        self.val = Defaulted{};
    }
}
