// complex optional + serialization + nested composite
struct InnerSerialized {
    x: Int as int64;
    y: Bool;
}

struct OuterSerializedOpt {
    foo: InnerSerialized?;
    bar: Int? as uint8;
    baz: Bool?;
}

contract ComplexOptSerialization {
    state: OuterSerializedOpt;

    init() {
        self.state = OuterSerializedOpt{
            foo: InnerSerialized{x:42,y:true},
            bar: 7,
            baz: false
        };
    }
}