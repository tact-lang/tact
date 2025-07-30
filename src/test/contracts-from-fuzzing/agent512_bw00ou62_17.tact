struct ManyOptionalDefaults {
    a: Int? = null;
    b: Bool? = null;
    c: String? = null;
    d: Slice? = null;
    e: Cell? = null;
    f: Address? = null;
}

contract ManyDefaultsOptTest {
    data: ManyOptionalDefaults;

    init() {
        self.data = ManyOptionalDefaults{};
    }
}
