struct InitDefaults {
    f1: Int = 1;
    f2: String = "sss";
    f3: Bool = true;
}

contract TestContract {
    s: InitDefaults;

    init() {
        self.s = InitDefaults{};
    }
}
