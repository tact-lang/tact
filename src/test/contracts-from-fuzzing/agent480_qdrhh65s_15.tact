struct Inner {
    description: String;
    active: Bool;
}

struct Outer {
    id: Int;
    nested: Inner?;
}

contract NestedOptComposite {
    outer: Outer;

    init() {
        self.outer = Outer{
            id: 1,
            nested: Inner{description: "desc", active:true},
        };
    }
}