struct NestedPacked {
    inner1: BitPacked;
    inner2: BitPacked;
}

struct BitPacked {
    a: Int as uint4;
    b: Int as uint4;
}

contract NestedPackedC {
    data: NestedPacked;

    init() {
        self.data = NestedPacked{
            inner1: BitPacked{a:1,b:2},
            inner2: BitPacked{a:3,b:4}
        };
    }
}
