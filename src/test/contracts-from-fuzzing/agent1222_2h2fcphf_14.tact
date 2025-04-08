struct OptDeep {
    x: Int?;
    y: Bool?;
    z: String?;
}

struct NestedOpt {
    inner: OptDeep?;
}

contract TestNestedOpt {
    s: NestedOpt;

    init() {
        self.s = NestedOpt{
            inner: null
        };
    }
}