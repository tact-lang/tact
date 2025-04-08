struct Inner {
    foo: Int;
    bar: Bool?;
}

struct Middle {
    baz: String?;
    inner: Inner;
}

contract Test {
    i: Int = 5;
    f: Bool = false;
    addr: Address? = null;
    txt: String = "hi";
    middle: Middle;

    init() {
        self.middle = Middle{
            baz: "bar",
            inner: Inner{
                foo:42,
                bar:true
            }
        };
    }

    receive() {}
}