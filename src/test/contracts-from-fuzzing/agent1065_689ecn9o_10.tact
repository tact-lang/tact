struct NestedLargeA {
    aa: Int;
    ab: Bool;
    ac: Int;
}

struct NestedLargeB {
    ba: Bool;
    bb: Int;
    bc: Bool;
    bd: NestedLargeA;
}

contract NestedLargeTest {
    data: NestedLargeB;
    init() {
        self.data = NestedLargeB{
            ba:true,
            bb:42,
            bc:false,
            bd:NestedLargeA{ aa:1, ab:true, ac:2 }
        };
    }
}