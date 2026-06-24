struct SDefaultOpt {
    val: Int? = null;
    text: String = "hello";
}

contract StructWithDefaults {
    s: SDefaultOpt;

    init() {
        self.s = SDefaultOpt{};
    }
}