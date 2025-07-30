struct OptSer {
    x: Int as uint32;
    y: Bool;
}

struct NestedOptSer {
    inner: OptSer?;
}

contract OptionalSerialization {
    data: NestedOptSer;

    init() {
        self.data = NestedOptSer{ inner: null };
    }
}