struct Inner {
    message: String;
}

struct Outer {
    inner: Inner;
}

contract StringNested {
    val: Outer;

    init() {
        self.val = Outer{
            inner: Inner{
                message: "Hello TON",
            },
        };
    }
}