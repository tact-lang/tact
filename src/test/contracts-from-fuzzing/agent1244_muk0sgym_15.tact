struct Leaf { val: Int; }

struct Middle {
    leaf: Leaf?;
    count: Int;
}

struct Outer {
    middle: Middle?;
    name: String;
}

contract NestedOptionStructs {
    state: Outer;

    init() {
        self.state = Outer{
            middle: null,
            name: "nest",
        };
    }
}
