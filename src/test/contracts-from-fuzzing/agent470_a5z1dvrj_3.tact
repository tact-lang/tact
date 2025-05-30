struct Inner {
    x: Int = 1;
}

struct Outer {
    nestedOpt: Inner?;  // optional nested struct
}

contract DeepOptStructOptField {
    data: Outer = Outer{ nestedOpt: null };

    init() {}
}