struct DefaultsWithOptionals {
    a: Int? = null;
    b: String? = null;
    c: Bool? = null;
}

contract TestContract {
    dwo: DefaultsWithOptionals;

    init() {
        self.dwo = DefaultsWithOptionals{};
    }
}