struct InnerOptDefault {
    num: Int? = null;
}

contract StructOptDefault {
    s: InnerOptDefault;

    init() {
        self.s = InnerOptDefault{};
    }
}
