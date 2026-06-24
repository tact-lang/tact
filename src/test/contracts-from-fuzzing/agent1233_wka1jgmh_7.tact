struct Inner {
    x: Int;
    y: Bool?;
}

struct Outer {
    left: Inner;
    right: Inner;
    name: String;
}

contract NestedStructsDeep {
    outer: Outer;

    init() {
        self.outer = Outer{
            left: Inner{x: 1, y: null},
            right: Inner{x: 2, y: true},
            name: "deep"
        };
    }
}