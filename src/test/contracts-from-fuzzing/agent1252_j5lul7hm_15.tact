struct NestedSerializer {
    outer: InnerSerialized;
}

struct InnerSerialized {
    a: Int as int64;
    b: Bool;
    c: String;
}

contract NestedSerializeContract {
    data: NestedSerializer;

    init() {
        self.data = NestedSerializer{
            outer: InnerSerialized{
                a: 77,
                b: true,
                c: "nested"
            }
        };
    }
}
