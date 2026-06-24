struct Inner {
    a: Int;
}

struct Middle {
    inner: Inner;
    b: String;
}

contract DefaultOnNested {
    data: Middle = Middle{
        inner: Inner{ a:1 },
        b: "default"
    };
}