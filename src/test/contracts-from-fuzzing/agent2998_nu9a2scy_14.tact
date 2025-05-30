struct DeepOptional {
    nested: Inner?;
}

struct Inner {
    leaf: Leaf?;
}

struct Leaf {
    s: String;
    b: Bool;
}

contract DeepOptTest {
    val: DeepOptional;
    init() {
        self.val = DeepOptional{
            nested: Inner{ leaf: Leaf{ s: "x", b: true } }
        };
    }
}