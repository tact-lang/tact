struct BoolLayer {
    a: Bool;
    b: Bool;
    c: Bool;
    d: Bool;
    e: Bool;
}

contract PackedBitsTest {
    flags: BoolLayer;

    init() {
        self.flags = BoolLayer{a:true,b:false,c:true,d:false,e:true};
    }
}