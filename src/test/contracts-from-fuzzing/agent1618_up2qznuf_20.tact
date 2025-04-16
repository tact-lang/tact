struct Inner {
    ok: Bool;
    label: String;
}

struct Outer {
    tag: String;
    inner: Inner;
}

contract TextNest {
    data: Outer;

    init() {
        self.data = Outer{
            tag: "TagText",
            inner: Inner{
                ok: true,
                label: "InnerText"
            }
        };
    }
}