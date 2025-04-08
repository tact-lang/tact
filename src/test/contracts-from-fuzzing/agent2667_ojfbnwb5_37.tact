struct OptionalStringStructDefaults {
    s: String? = null;
    i: Int = 5;
}

contract OptStringDefaultsContract {
    data: OptionalStringStructDefaults;

    init() {
        self.data = OptionalStringStructDefaults{};
    }

    receive() {
        self.data = OptionalStringStructDefaults{s:"hi", i:10};
    }
}