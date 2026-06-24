struct HasIntSizes {
    a: Int as uint8;
    b: Int as int16;
    c: Int as uint64;
    d: Int as coins;
}

contract IntSizesTest {
    data: HasIntSizes;
    init() {
        self.data = HasIntSizes{ a:1,b:2,c:3,d:4 };
    }
}