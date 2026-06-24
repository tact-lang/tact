struct Outer {
    x: Int;
    s: Inner?;
}

struct Inner {
    y: Int;
    z: Bool?;
}

contract NestedOptMix {
    val: Outer;
    init() {
        self.val = Outer{
            x: 5,
            s: null
        };
    }
}