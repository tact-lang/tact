struct DefaultOptionals {
    a: Int? = null;
    b: Bool? = null;
    c: String? = null;
}

contract TestContract {
    val: DefaultOptionals;

    init() {
        self.val = DefaultOptionals{};
    }
}