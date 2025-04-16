struct Inner {
    a: Int;
    b: Bool;
    c: String;
}

struct Outer {
    x: Int;
    y: Inner;
    z: Bool;
}

contract DeeplyNested {
    val: Outer;

    init() {
        self.val = Outer{
            x: 1,
            y: Inner{ a: 2, b: true, c: "hi" },
            z: false
        };
    }
}
