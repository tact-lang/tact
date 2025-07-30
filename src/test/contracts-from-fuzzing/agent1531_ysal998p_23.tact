struct MixedSer {
    a: Int as int7;
    b: Int as uint9;
    c: Int as int23;
    d: Int as uint53;
}

contract TestMixedSer {
    data: MixedSer;

    init() {
        self.data = MixedSer{a:1,b:2,c:3,d:4};
    }
}
