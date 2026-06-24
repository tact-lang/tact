struct MultiSer {
    a: Int as uint8;
    b: Int as int32;
    c: Int as coins;
    d: Int;
}

contract MultiSerStructs {
    x: MultiSer;
    y: MultiSer;

    init() {
        self.x = MultiSer{ a:1,b:-2,c:ton("1"),d:4 };
        self.y = MultiSer{ a:2,b:-3,c:ton("2"),d:5 };
    }
}