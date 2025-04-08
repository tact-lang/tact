struct Packed {
    a:Int as uint8;
    b:Int as uint8;
    c:Int as uint8;
    d:Int as uint8;
    e:Int as uint8;
    f:Int as uint8;
    g:Int as uint8;
    h:Int as uint8;
}

contract PackedState {
    p:Packed;
    init() {
        self.p = Packed{ a:1,b:2,c:3,d:4,e:5,f:6,g:7,h:8 };
    }
}