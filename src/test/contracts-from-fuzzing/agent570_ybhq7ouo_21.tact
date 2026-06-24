struct InnerMost {
    val: Int;
    comment: String = "hi";
    opt: Address?;
}

struct Inner {
    im: InnerMost;
    note: String?;
}

struct Outer {
    inner: Inner;
    ok: Bool;
}

contract DeepDefaultProp {
    data: Outer;

    init() {
        self.data = Outer{
            inner: Inner{
                im: InnerMost{ val: 5 },
                note: null
            },
            ok: true
        };
    }

    receive() {}
}