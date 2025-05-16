struct SDefOpt {
    a: Int? = null;
}

contract DefNullOptField {
    s: SDefOpt;

    init() {
        self.s = SDefOpt{};
    }
}