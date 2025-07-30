struct SerialSpec {
    coinsVal: Int as coins;
    uintVal: Int as uint32;
    intVal: Int as int64;
}

contract Test {
    data: SerialSpec;

    init() {
        self.data = SerialSpec{
            coinsVal: 1000,
            uintVal: 256,
            intVal: -42
        };
    }
}
