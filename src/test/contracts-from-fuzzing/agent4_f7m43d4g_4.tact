struct Inner {
    flag: Bool;
    data: String;
}

struct Outer {
    inner: Inner;
    num: Int;
}

contract DeepNested {
    out: Outer = Outer{
        inner: Inner{
            flag: true,
            data: "nested"
        },
        num: 42
    };
}