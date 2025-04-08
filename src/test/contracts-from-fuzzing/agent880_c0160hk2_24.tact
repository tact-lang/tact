struct SerOpts {
    x: Int as uint4;
    y: Int as int64;
    z: Int as uint251;
}

contract StructSerialization {
    f: SerOpts;

    init() {
        self.f = SerOpts{
            x: 5,
            y: -1000,
            z: 777,
        };
    }
}