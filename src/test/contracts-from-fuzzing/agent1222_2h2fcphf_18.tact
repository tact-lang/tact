struct SerStruct {
    x: Int as int64;
    y: Int as uint32;
    z: Int as coins;
}

contract SerTest {
    s: SerStruct;

    init() {
        self.s = SerStruct{
            x: 42,
            y: 10,
            z: ton("1.5")
        };
    }
}