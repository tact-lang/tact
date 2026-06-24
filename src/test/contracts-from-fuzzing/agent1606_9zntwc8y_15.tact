struct LargeTuple {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: String?;
    f: Bool;
    g: Int as uint8;
    h: Int as uint16;
    i: Int as uint32;
    j: Int as uint64;
}

contract LargeFieldMix {
    x: LargeTuple;

    init() {
        self.x = LargeTuple{
            a:1,b:true,c:"z",d:null,e:"y",f:false,g:7,h:8,i:9,j:10,
        };
    }

    receive() {
        let v = self.x;
    }
}