struct Sub {
    x: Int as uint32;
    y: Bool?;
}

struct Outer {
    inner: Sub;
    z: Int as int64;
}

contract MixedSer {
    data: Outer;

    init() {
        self.data = Outer{
            inner: Sub{ x: 123, y: null },
            z: -99999
        };
    }
}