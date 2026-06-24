struct Defaulted {
    val: Int = 5;
    opt: Int? = null;
}

contract StructDefaults {
    data: Defaulted;

    init() {
        self.data = Defaulted{};
    }
}