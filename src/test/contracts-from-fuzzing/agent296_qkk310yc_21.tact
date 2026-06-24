struct InnerDefault {
    val: Int = 777;
}

contract StructInContract {
    nested: InnerDefault;

    init() {
        self.nested = InnerDefault{};
    }
}
