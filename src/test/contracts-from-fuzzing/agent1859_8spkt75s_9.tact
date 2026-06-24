struct PackedBools {
    a: Bool;
    b: Bool;
    c: Bool;
    d: Bool;
    e: Bool;
    f: Bool;
    g: Bool;
    h: Bool;
}

contract BitPackingTest {
    flags: PackedBools;
    init() {
        self.flags = PackedBools{
            a:true,b:false,c:true,d:false,e:true,f:false,g:true,h:true
        };
    }
}