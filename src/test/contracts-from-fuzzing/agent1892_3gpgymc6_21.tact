struct ManySimple {
    i1: Int;
    i2: Int;
    i3: Int;
    i4: Int;
    i5: Int;
    s1: String;
    s2: String;
    b1: Bool;
    b2: Bool;
}

contract SimpleFields {
    data: ManySimple;
    
    init() {
        self.data = ManySimple{
            i1: 1,
            i2: 2,
            i3: 3,
            i4: 4,
            i5: 5,
            s1: "hello",
            s2: "world",
            b1: true,
            b2: false,
        };
    }
}