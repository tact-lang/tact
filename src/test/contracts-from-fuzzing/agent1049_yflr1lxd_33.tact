struct STest {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: String?;
    f: Bool?;
}

contract NullableStructTop {
    big: STest?;

    init() {
        self.big = null;
    }
}