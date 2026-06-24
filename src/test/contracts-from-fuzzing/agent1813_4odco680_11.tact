struct NestedSerialization {
    a: Int as uint4;
    b: Int as int32;
    inn: Inner;
}

struct Inner {
    x: Int as uint8;
    y: Bool;
}

contract NestedSer {
    val: NestedSerialization;

    init() {
        self.val = NestedSerialization{ a:3, b:-22, inn: Inner{ x:255, y:true } };
    }
}