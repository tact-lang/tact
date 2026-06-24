struct Inner1 {
    a: Int;
    b: String;
}

struct Inner2 {
    c: Bool;
    d: Int?;
}

struct Outer {
    f: Inner1;
    g: Inner2;
}

contract MixNested {
    data: Outer;

    init() {
        self.data = Outer{
            f: Inner1{ a: 5, b: "xx" },
            g: Inner2{ c: false, d: null }
        };
    }
}