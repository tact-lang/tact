struct NestedInner {
    a: Int;
    b: Bool?;
    s: String;
}

struct NestedOuter {
    x: Int;
    y: NestedInner;
    z: Bool;
}

contract DeepNestContract {
    val: NestedOuter;

    init() {
        self.val = NestedOuter{
            x: 1,
            y: NestedInner{
                a: 10,
                b: true,
                s: "test"
            },
            z: false
        };
    }
}
