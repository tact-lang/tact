struct Serialization {
    f1: Int as uint4;
    f2: Int as int128;
    f3: Int as uint256;
    f4: Int;
    f5: Int as int64;
    f6: Int as uint7;
}

contract MixedSerialization {
    val: Serialization;
    init() {
        self.val = Serialization{ f1:1, f2:2, f3:3, f4:4, f5:5, f6:6 };
    }
}