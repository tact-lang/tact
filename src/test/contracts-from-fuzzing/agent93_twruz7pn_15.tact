struct InnerDefault {
    val: Int = 99;
    txt: String = "def";
}

struct OuterDefault {
    inner: InnerDefault = InnerDefault{};
    msg: String = "hi";
}

contract StructWithDefaults {
    d: OuterDefault;

    init() {
        self.d = OuterDefault{};
    }
}