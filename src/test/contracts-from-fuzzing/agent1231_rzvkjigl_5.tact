struct Inner {
    foo: Int;
    bar: String;
}

struct Middle {
    data: Inner;
    flag: Bool;
}

struct Outer {
    m1: Middle;
    m2: Middle;
    txt: String;
}

contract TestContract {
    val: Outer;

    init() {
        self.val = Outer{
            m1: Middle{ data: Inner{foo:1, bar:"a"}, flag:true },
            m2: Middle{ data: Inner{foo:2, bar:"b"}, flag:false },
            txt: "hello"
        };
    }
}
