struct PackedStruct {
    a: Int as uint1;
    b: Int as uint1;
    c: Int as uint1;
    d: Int as uint1;
    e: Int as uint1;
    f: Int as uint1;
    g: Int as uint1;
    h: Int as uint1;
    i: Int as uint1;
    j: Int as uint1;
}

contract BitsContract {
    ps: PackedStruct;

    init() {
        self.ps = PackedStruct{
            a:1,b:0,c:1,d:0,e:1,f:0,g:1,h:0,i:1,j:0
        };
    }
}