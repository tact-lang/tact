struct Outer {
    nested: Inner;
    other: Int;
}

struct Inner {
    a: Int;
    b: Bool;
    c: String;
}

contract TestContract {
    st: Outer = Outer{
        nested: Inner{
            a: 5,
            b: true,
            c: "X"
        },
        other: 9
    };
}