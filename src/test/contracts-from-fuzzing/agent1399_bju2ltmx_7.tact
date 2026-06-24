struct Inner {
    a: Int = 1;
}

struct Middle {
    inner: Inner;
    b: Bool = false;
}

struct Outer {
    mid: Middle;
    c: String = "hi";
}

contract TestContract {
    deep: Outer = Outer{
        mid: Middle{
            inner: Inner{
                a: 42
            },
            b: true
        },
        c: "ok"
    };
}