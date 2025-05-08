struct WeirdComb {
    val1: Int as uint32;
    val2: Int as int64;
    val3: Int as int257;
}

contract WeirdSerial {
    data: WeirdComb;

    init() {
        self.data = WeirdComb{
            val1: 100,
            val2: -1000,
            val3: -1000000000000000,
        };
    }
}