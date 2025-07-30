struct Inner {
    flag: Bool;
    count: Int;
    message: String;
}

struct Outer {
    inner: Inner;
    optionalInner: Inner?;
    status: Bool;
    note: String;
}

contract PersistNested {
    saved: Outer;

    init() {
        self.saved = Outer{
            inner: Inner{
                flag: true,
                count: 10,
                message: "hi"
            },
            optionalInner: null,
            status: false,
            note: "note"
        };
    }
}
