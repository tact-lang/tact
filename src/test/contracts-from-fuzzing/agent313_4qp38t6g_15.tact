struct OptionalStructFieldDefaults {
    x: Int? = null;
    y: Bool? = true;
    z: String? = null;
}

struct OuterWithOptionalStruct {
    inner: OptionalStructFieldDefaults = OptionalStructFieldDefaults{};
    flag: Bool = false;
}

contract OptionalStructDefaultsTest {
    val: OuterWithOptionalStruct;

    init() {
        self.val = OuterWithOptionalStruct{};
    }
}