struct Inner {
    x: Int;
    y: String;
}

struct Outer {
    nested: Inner;
    flag: Bool;
}

contract NestedStructs {
    val: Outer;

    init() {
        self.val = Outer{
            nested: Inner{
                x: 7,
                y: "deep"
            },
            flag: false
        };
    }
}
