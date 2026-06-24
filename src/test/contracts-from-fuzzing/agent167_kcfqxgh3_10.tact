struct Combo {
    a: Int = 42;
    b: Bool = true;
    c: String = "hi";
    d: Int?;
    e: String?;
    f: Bool?;
}

contract MixedTypes {
    data: Combo;

    init() {
        self.data = Combo{
            a: 1,
            b: false,
            c: "changed",
            d: 44,
            e: "opt",
            f: true
        };
    }
}