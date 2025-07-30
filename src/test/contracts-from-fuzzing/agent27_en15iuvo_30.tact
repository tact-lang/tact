struct A {
    f1: Int? = null;
    f2: Bool? = null;
    f3: String? = null;
}

contract OptDefaults {
    opt: A;

    init() {
        self.opt = A{};
    }
}