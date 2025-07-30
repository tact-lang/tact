struct DefaultsAndOptionals {
    a: Int = 1;
    b: Bool? = null;
    c: String = "hi";
}

contract TestContract {
    d: DefaultsAndOptionals;

    init() {
        self.d = DefaultsAndOptionals{};
    }
}