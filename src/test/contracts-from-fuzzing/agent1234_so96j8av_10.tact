struct Formats {
    a: Int as int64;
    b: Int as uint4;
    c: Int as coins;
}

contract FormatNestedTest {
    f: Formats;

    init() {
        self.f = Formats{
            a: 12345678,
            b: 9,
            c: ton("1"),
        };
    }
}