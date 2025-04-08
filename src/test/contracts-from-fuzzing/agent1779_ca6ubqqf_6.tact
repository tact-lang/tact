struct Inner {
    a: Int;
}

struct Middle {
    inner: Inner;
}

struct Outer {
    middle: Middle;
    flag: Bool;
}

contract DeepNestedStruct {
    outer: Outer;
    init() {
        self.outer = Outer{middle: Middle{inner: Inner{a: 99}}, flag: true};
    }
}