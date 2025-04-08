struct Inner1 {
    a: Int;
    b: Bool;
}

struct Inner2 {
    c: String;
    d: Int?;
}

struct Outer {
    x: Inner1;
    y: Inner2;
    z: Bool;
    w: String?;
}

contract DeepNested {
    data: Outer;
    init() {
        self.data = Outer{
            x: Inner1{ a: 1, b: true },
            y: Inner2{ c: "c", d: null },
            z: false,
            w: null,
        };
    }
}