struct MixedDefaults {
    a: Int = 0;
    b: Bool = false;
    c: String = "";
    d: Int?;
    e: Bool?;
    f: String?;
}

contract DefaultsTest {
    val: MixedDefaults;

    init() {
        self.val = MixedDefaults{
            a: 7,
            b: true,
            c: "hi",
            d: null,
            e: null,
            f: null,
        };
    }
}