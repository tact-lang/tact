struct Coord {
    lat: Int as int16;
    lon: Int as int16;
}

contract TestContract {
    a: Int as uint8 = 0;
    b: Int as int16;
    c: Int as uint32;
    d: Int? = null;
    coord: Coord = Coord{ lat: -90, lon: 180 };
    e: Int as uint4;

    init() {
        self.b = -123;
        self.c = 123456;
        self.e = 10;
    }
}