struct InnerMost {
    z: Int;
}

struct Middle {
    y: InnerMost;
    extra: Bool;
}

struct Outer {
    x: Middle;
    flag: Bool;
}

contract TestContract {
    nested: Outer = Outer{x: Middle{y: InnerMost{z: 7}, extra: false}, flag: true};
    init() {}
}