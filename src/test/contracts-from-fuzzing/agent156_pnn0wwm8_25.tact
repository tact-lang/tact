struct PackedPrimitives {
    a: Int as uint4;
    b: Int as uint4;
    c: Int as uint4;
    d: Int as uint4;
    e: Int as uint4;
}

contract PackedPrimsTest {
    p: PackedPrimitives;

    init() {
        self.p = PackedPrimitives{
            a:1,b:2,c:3,d:4,e:5
        };
    }
}
