struct OptionalInner {
    a: Int;
    b: Bool;
}

struct Outer {
    inner: OptionalInner?;
    flag: Bool;
}

contract OptionalContract {
    data: Outer;

    init() {
        self.data = Outer{
            inner: null,
            flag: false,
        };
    }
}