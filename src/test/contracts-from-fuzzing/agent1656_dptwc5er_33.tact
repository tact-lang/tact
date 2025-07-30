struct OptDeep {
    a: Int?;
    b: OptMid?;
}

struct OptMid {
    x: Bool;
    y: OptInner?;
}

struct OptInner {
    f: String?;
}

contract OptDeepContract {
    data: OptDeep;

    init() {
        self.data = OptDeep{
            a: null,
            b: null,
        };
    }
}
