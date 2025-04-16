struct OptPacked {
    a: Int? as uint8;
    b: Int? as uint16;
    c: Int? as int32;
}

contract Test {
    p: OptPacked = OptPacked{a:null,b:null,c:null};

    init() {
        self.p = OptPacked{a:1,b:2,c:3};
    }
}