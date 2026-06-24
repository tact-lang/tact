struct Inner {
    x: Int;
    y: Bool;
}

struct Outer {
    s: Inner;
    label: String;
}

contract NestedStructPersist {
    val: Outer = Outer{
        s: Inner{
            x: -100,
            y: false
        },
        label: "NestedTest"
    };

    init() {}
}