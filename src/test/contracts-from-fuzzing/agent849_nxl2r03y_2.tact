struct Inner {
    val: Int;
    ok: Bool;
}

struct Middle {
    optInner: Inner?;
    label: String;
}

contract TestContract {
    data: Middle;

    init() {
        self.data = Middle{
            optInner: Inner{ val: 7, ok: true },
            label: "hello"
        };
    }
}