struct NestedSerialization {
    a: Int as int32;
    b: NestedInner;
}

struct NestedInner {
    c: Int as uint32;
    d: NestedDeeper;
}

struct NestedDeeper {
    e: Int as int64;
    f: Int as uint64;
}

contract NestedSerializationContract {
    data: NestedSerialization;

    init() {
        self.data = NestedSerialization{
            a: -1,
            b: NestedInner{
                c: 2,
                d: NestedDeeper{
                    e: -3,
                    f: 4
                }
            }
        };
    }
}