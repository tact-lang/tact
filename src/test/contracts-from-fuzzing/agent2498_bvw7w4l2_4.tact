struct ManyDefaults {
    a: Int = 1;
    b: String = "abc";
    c: Bool = false;
    d: Int? = null;
    e: String? = null;
    f: Bool? = null;
}

contract TestContract {
    val: ManyDefaults;

    init() {
        self.val = ManyDefaults{
            a: 10,
            b: "zzz",
            c: true,
            d: 99,
            e: "opt",
            f: false,
        };
    }
}