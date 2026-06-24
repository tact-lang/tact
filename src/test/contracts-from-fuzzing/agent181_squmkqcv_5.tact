struct Inner {
    s: String;
    opt: Bool?;
}

struct Middle {
    inner: Inner;
    num: Int;
}

contract TestNestedStructs {
    data: Middle;

    init() {
        self.data = Middle{
            inner: Inner{
                s: "abc",
                opt: true,
            },
            num: 777,
        };
    }
}
