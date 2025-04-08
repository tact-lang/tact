struct Inner {
    x: Int;
    y: Bool;
}

struct Outer {
    val: Inner;
    flag: Bool;
}

contract NestedStructField {
    s: Outer;

    init() {
        self.s = Outer{val: Inner{x: 5, y: false}, flag: true};
    }
}