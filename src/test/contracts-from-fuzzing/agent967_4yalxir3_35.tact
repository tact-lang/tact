struct OptBoolLayer {
    a: Bool?;
    b: Bool?;
    c: Bool?;
    d: Bool?;
    e: Bool?;
}

contract OptPackedBitsTest {
    flags: OptBoolLayer;

    init() {
        self.flags = OptBoolLayer{a:null,b:null,c:null,d:null,e:null};
    }
}