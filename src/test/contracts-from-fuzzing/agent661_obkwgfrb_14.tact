struct OptionalDeep {
    inner: Inner?;
}

struct Inner {
    flag: Bool;
}

contract OptRec {
    data: OptionalDeep;

    init() {
        self.data = OptionalDeep{
            inner: Inner{ flag: true }
        };
    }
}