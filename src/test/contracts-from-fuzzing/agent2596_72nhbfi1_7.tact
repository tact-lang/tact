struct SDefOpt {
    i: Int? = 123;
}

contract StructDefOpt {
    f: SDefOpt;

    init() {
        self.f = SDefOpt{};
    }
}