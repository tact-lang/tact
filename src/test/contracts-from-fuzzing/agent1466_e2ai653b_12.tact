struct NestedOptionalDefault {
    val: Int? = null;
    flag: Bool = true;
}

contract OptDefTest {
    data: NestedOptionalDefault;

    init() {
        self.data = NestedOptionalDefault{};
    }
}
