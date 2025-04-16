struct Inner {
    a: Int;
    b: String?;
}

struct Outer {
    x: Int;
    y: Inner?;
    z: Bool;
}

contract OptStructOpt {
    val: Outer;

    init() {
        self.val = Outer{
            x: 0,
            y: null,
            z: true,
        };
    }
}