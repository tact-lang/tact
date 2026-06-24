struct NestedOptionalDefaults {
    a: Int? = null;
    b: SubNestedOpt? = null;
}

struct SubNestedOpt {
    c: Bool? = null;
    d: String? = null;
}

contract NestedOptionalDefaultsTest {
    data: NestedOptionalDefaults;

    init() {
        self.data = NestedOptionalDefaults{};
    }
}
