struct Prefixes {
    a: Int as int4;
    b: Int as int8;
    c: Int as uint4;
    d: Int as uint8;
    e: Int as coins;
}

contract SerializedInts {
    data: Prefixes = Prefixes{ a: 1, b: -2, c: 3, d: 4, e: 5 };

    receive() {
        self.data = self.data;
    }
}