struct DeepNest {
    a: Int;
    inner: Inner;
}

struct Inner {
    flag: Bool;
    coord: Coord;
}

struct Coord {
    lat: Int;
    lon: Int;
}

contract NestedStructs {
    deep: DeepNest;

    init() {
        self.deep = DeepNest{
            a: 5,
            inner: Inner{
                flag: true,
                coord: Coord{
                    lat: 10,
                    lon: 20
                }
            }
        };
    }
}
