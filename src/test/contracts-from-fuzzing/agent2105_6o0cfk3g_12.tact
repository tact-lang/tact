struct OptionalAndDefault {
    a: Int? = null;
    b: Bool = true;
    c: String = "hello";
}

contract TestContract {
    s: OptionalAndDefault;

    init() {
        self.s = OptionalAndDefault{};
    }
}