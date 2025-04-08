struct Inner {
    x: Int;
    y: Bool?;
}

struct Middle {
    a: Inner;
    b: Int?;
}

struct Outer {
    m: Middle;
    s: String;
}

contract TestNested {
    data: Outer = Outer{ m: Middle{ a: Inner{ x: 1, y: null }, b: null }, s: "" };

    init() {}
}