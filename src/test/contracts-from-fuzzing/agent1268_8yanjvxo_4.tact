struct DefaultOptionals {
    a: Int? = null;
    b: String? = null;
    c: Bool? = null;
}

contract TestContract {
    d: DefaultOptionals;

    init() {
        self.d = DefaultOptionals{};
    }
}