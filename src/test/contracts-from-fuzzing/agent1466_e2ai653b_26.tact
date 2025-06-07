struct StructWithDefaults {
    a: Int = 7;
    b: Bool = true;
    c: String = "foo";
    d: Int? = null;
}

contract DefOptTest {
    val: StructWithDefaults;

    init() {
        self.val = StructWithDefaults{};
    }
}
