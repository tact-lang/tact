struct Inner {
    score: Int as uint16;
    active: Bool?;
    label: String;
}

struct Outer {
    id: Int as uint64;
    content: Inner;
}

contract Test {
    saved: Outer;

    init() {
        self.saved = Outer{
            id: 1234,
            content: Inner{
                score: 99,
                active: true,
                label: "ok",
            },
        };
    }
}