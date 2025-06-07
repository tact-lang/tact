struct NestedOptionalDefaults {
    n: Int?;
    s: NestedIn?;
}

struct NestedIn {
    foo: Bool?;
}

contract NestedOptionalDefaultsTest {
    val: NestedOptionalDefaults;

    init() {
        self.val = NestedOptionalDefaults{
            n: null,
            s: null
        };
    }
}