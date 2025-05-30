struct Packed {
    n1: Int as uint4;
    n2: Int as uint4;
    n3: Int as uint4;
    n4: Int as uint4;
    n5: Int as uint4;
    n6: Int as uint4;
    n7: Int as uint4;
    n8: Int as uint4;
}

contract PackedFields {
    pack: Packed;
    
    init() {
        self.pack = Packed{
            n1:1,n2:2,n3:3,n4:4,n5:5,n6:6,n7:7,n8:8
        };
    }
}