struct SerializeInts {
    a: Int as int8;
    b: Int as uint32;
    c: Int;
    d: Int as int64;
    e: Int as uint1;
}

contract SerializedPersistent {
    val: SerializeInts;

    init() {
        self.val = SerializeInts{
            a: 1, b: 1000, c: 2000, d: -50, e: 1
        };
    }

    receive() {}
}