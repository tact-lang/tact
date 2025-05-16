struct OptionalsAndDefaults {
    a: Int = 5;
    b: Int?;
    c: Bool = true;
    d: Bool?;
    s: String = "hello";
    t: String?;
}

contract Mixed {
    val: OptionalsAndDefaults;
    init() {
        self.val = OptionalsAndDefaults {
            a: 100,
            b: null,
            c: false,
            d: true,
            s: "world",
            t: null
        };
    }
    receive() {
        if (self.val.d != null) {
            let _ = self.val.d!!;
        }
    }
}