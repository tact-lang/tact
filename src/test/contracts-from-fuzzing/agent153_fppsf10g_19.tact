struct ManyDefaults {
    a: Int = 1;
    b: Bool = false;
    c: String = "hi";
    d: Int?; // implicit null
    e: String?; // implicit null
}

contract DefaultsMix {
    val: ManyDefaults;

    init() {
        self.val = ManyDefaults{};
    }

    receive() {
        self.val = ManyDefaults{
            a: 55,
            b: true,
            c: "boo",
            d: 77,
            e: "set"
        };
    }
}