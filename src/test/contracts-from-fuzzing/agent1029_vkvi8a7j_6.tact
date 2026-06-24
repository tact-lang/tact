struct Middle {
    a: Int;
    b: Int;
    inner: Inner;
}

struct Inner {
    c: Int;
    d: Bool?;
    text: String;
}

contract TestContract {
    val: Middle;
    init() {
        self.val = Middle{
            a: 1,
            b: 2,
            inner: Inner{
                c: 3,
                d: null,
                text: "hi"
            }
        };
    }
}
