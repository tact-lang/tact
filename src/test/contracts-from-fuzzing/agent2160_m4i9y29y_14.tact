struct Inner {
    a: Int;
    b: Bool;
}

struct Middle {
    inner: Inner;
    str: String;
}

struct Outer {
    m: Middle;
    opt: Bool?;
}

contract NestedOpt {
    data: Outer;

    init() {
        self.data = Outer{
            m: Middle{
                inner: Inner{a:1, b:false},
                str: "hi"
            },
            opt: null
        };
    }
}