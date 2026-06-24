struct StructOptDefault {
    num: Int? = null;
    txt: String? = null;
    flag: Bool? = null;
}

contract OptDefaultsContract {
    s: StructOptDefault;

    init() {
        self.s = StructOptDefault{};
    }
}
