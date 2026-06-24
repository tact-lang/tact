struct MixedSer {
    i1: Int as uint64;
    i2: Int;
    i3: Int as int8;
    flag: Bool;
    text: String;
}

contract MixedSerTest {
    s: MixedSer;

    init() {
        self.s = MixedSer{
            i1: 123,
            i2: -456,
            i3: 7,
            flag: false,
            text: "zzz"
        };
    }
}