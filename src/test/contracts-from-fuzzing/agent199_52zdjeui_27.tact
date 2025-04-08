struct NestedSerialization {
    s1: Inside;
}

struct Inside {
    foo: Int as uint32;
    bar: Int as int64;
    baz: Bool;
}

contract NestedSerializationContract {
    s: NestedSerialization;

    init() {
        self.s = NestedSerialization{
            s1: Inside{
                foo:1,
                bar:2,
                baz:true,
            },
        };
    }
}