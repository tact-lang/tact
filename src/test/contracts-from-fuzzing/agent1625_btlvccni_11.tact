struct MultipleBools {
    a: Bool;
    b: Bool;
    c: Bool;
    d: Bool;
    e: Bool;
    f: Bool;
}

contract ManyBoolsTest {
    flags: MultipleBools;

    init() {
        self.flags = MultipleBools{
            a: true,
            b: false,
            c: true,
            d: false,
            e: true,
            f: false
        };
    }
}
