struct Combo {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Inner?;
}

struct Inner {
    val: Int;
}

contract TestContract {
    combo: Combo;

    init() {
        self.combo = Combo{ a: null, b: true, c: "hi", d: Inner{ val: 7 } };
    }
}