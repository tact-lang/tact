struct NestedIntSerialization {
    x: Int as int32;
    y: Int as uint32;
    z: Int;
}

contract StructNestedSerialization {
    val: NestedIntSerialization;

    init() {
        self.val = NestedIntSerialization{
            x: -1000,
            y: 1000,
            z: 5000
        };
    }
}