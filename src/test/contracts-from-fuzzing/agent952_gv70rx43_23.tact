struct Packed {
    b1: Bool;
    b2: Bool;
    i1: Int as uint4;
    i2: Int as uint4;
    b3: Bool;
    i3: Int as uint4;
    b4: Bool;
    i4: Int as uint4;
}

contract PackedTest {
    p: Packed;

    init() {
        self.p = Packed{
            b1:true,b2:false,i1:1,i2:2,b3:true,i3:3,b4:false,i4:4
        };
    }
}
