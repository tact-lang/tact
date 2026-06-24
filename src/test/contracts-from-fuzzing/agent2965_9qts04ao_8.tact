struct DefaultsAndExplicitValues {
    x: Int = 5;
    y: Bool = false;
    z: String = "abc";
}

contract TestContract {
    val: DefaultsAndExplicitValues;

    init() {
        self.val = DefaultsAndExplicitValues{};
    }
}
