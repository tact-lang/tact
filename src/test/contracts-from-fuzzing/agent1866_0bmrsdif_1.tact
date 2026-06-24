struct Inner {
    a: Int;
    b: Bool;
}

struct Outer {
    x: Int;
    y: Inner;
    z: Bool?;
}

contract Test {
    val: Outer;

    init() {
        self.val = Outer{
            x: 1,
            y: Inner{a: 2, b: true},
            z: false,
        };
    }
}