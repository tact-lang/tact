struct SerializeInts {
    a: Int as uint32;
    b: Int as int64;
}

struct OptSer {
    a: Int?;
    b: Bool?;
    c: String?;
}

struct NestedSer {
    s1: SerializeInts;
    s2: OptSer;
}

contract NestedSerUsage {
    data: NestedSer;

    init() {
        self.data = NestedSer{
            s1: SerializeInts{ a: 10, b: -20 },
            s2: OptSer{ a: null, b: null, c: null }
        };
    }
}
