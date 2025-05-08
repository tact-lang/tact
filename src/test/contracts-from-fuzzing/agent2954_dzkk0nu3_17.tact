struct Reordered {
    a: Int as uint32;
    b: Int;
    c: Int as uint64;
    d: Int;
    e: Int as uint8;
}

contract ReorderedSizes {
    test: Reordered;
    init() {
        self.test = Reordered{
            a:1,b:2,c:3,d:4,e:5
        };
    }
}
