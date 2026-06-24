struct Messy {
    a: Int = 1;
    b: String;
    c: Bool = false;
    d: Int?;
    e: Bool = true;
    f: Int?;
}

contract MixedInit {
    m: Messy;

    init() {
        self.m = Messy {
            b: "x",
            d: null,
            f: null
        };
    }
}