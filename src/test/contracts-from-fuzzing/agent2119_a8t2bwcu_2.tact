struct Inner1 {
    a: Int;
    b: Bool;
}

struct Inner2 {
    c: Int?;
    d: String;
}

struct Middle {
    x: Inner1;
    y: Inner2;
    z: Bool?;
}

contract DeepCombo {
    m: Middle;

    init() {
        self.m = Middle{
            x: Inner1{ a: 5, b: true },
            y: Inner2{ c: null, d: "hi" },
            z: false
        };
    }
}
