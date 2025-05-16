struct OptInner {
    value: Int?;
    flag: Bool?;
}

struct OptOuter {
    name: String;
    inner: OptInner?;
}

contract TestContract {
    stored: OptOuter;

    init() {
        self.stored = OptOuter{
            name: "test",
            inner: OptInner{
                value: null,
                flag: true
            }
        };
    }
}