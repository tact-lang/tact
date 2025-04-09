struct BigSerializers {
    a: Int as int128;
    b: Int as uint128;
    c: Int as int64;
    d: Int as uint64;
}

contract SerializeBigContract {
    data: BigSerializers;

    init() {
        self.data = BigSerializers{
            a: -100,
            b: 100,
            c: -50,
            d: 50
        };
    }
}