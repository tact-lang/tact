struct Inner {
    x: Int;
    y: Bool?;
}

struct Outer {
    a: Int = 1;
    b: String = "foo";
    c: Inner;
}

contract Test {
    data: Outer = Outer{
        a: 5,
        b: "bar",
        c: Inner{
            x: 10,
            y: null,
        }
    };

    init() {}
}