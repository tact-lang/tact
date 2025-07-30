struct Ints {
    i8: Int as int8;
    i16: Int as int16;
    i32: Int as int32;
    i64: Int as int64;
}

contract SignedInts {
    values: Ints = Ints{ i8:5, i16:-100, i32:999, i64:-50000 };

    init() {
        self.values = self.values;
    }

    receive() {
        self.values = self.values;
    }
}