struct VarySerialize {
    a: Int as uint8;
    b: Int as uint16;
    c: Int as uint32;
    d: Int as int64;
    e: Int as int128;
}

contract SerializeWidthsTest {
    val: VarySerialize;

    init() {
        self.val = VarySerialize{ a: 1, b: 2, c: 3, d: 4, e: 5 };
    }
}