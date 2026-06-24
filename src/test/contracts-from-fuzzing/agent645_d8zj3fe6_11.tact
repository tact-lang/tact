struct MixedDefaults {
    a: Int = 1;
    b: String = "abc";
    c: Bool = false;
    d: Int?; // defaults to null implicitly
    e: String?; // defaults to null
    f: Bool?; // defaults to null
}

contract DefaultTest {
    data: MixedDefaults;

    init() {
        self.data = MixedDefaults{
            a: 5,
            b: "xyz",
            c: true,
            d: null,
            e: null,
            f: null,
        };
    }
}
