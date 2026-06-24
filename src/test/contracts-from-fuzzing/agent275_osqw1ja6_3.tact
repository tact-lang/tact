struct DeepInner {
    x: Int;
    y: Bool;
}

struct DeepMid {
    first: DeepInner;
    second: DeepInner;
}

struct DeepOuter {
    m: DeepMid;
    opt_inner: DeepInner?;
}

contract TestContract {
    payload: DeepOuter;

    init() {
        self.payload = DeepOuter{
            m: DeepMid{
                first: DeepInner{x: 1, y: true},
                second: DeepInner{x: 2, y: false},
            },
            opt_inner: null,
        };
    }
}