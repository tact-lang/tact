struct Ints {
    i64: Int as int64;
    u4: Int as uint4;
    big: Int as int257;
}

contract IntSerializationContract {
    v: Ints;
    init() {
        self.v = Ints{i64:-2,u4:10,big:(1<<200)};
    }
}