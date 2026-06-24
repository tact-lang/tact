struct HasDefaults {
    i: Int = 5;
    b: Bool = true;
    s: String = "hi";
}

contract TestContract {
    hd: HasDefaults = HasDefaults{};

    init() {
        // empty
    }
}