struct RecA {
    foo: Int;
}

struct RecB {
    bar: Int;
    imb: RecA;
}

struct RecC {
    baz: RecB;
    qux: Int?;
}

contract NestMix {
    rec: RecC;

    init() {
        self.rec = RecC{
            baz: RecB{
                bar: 123,
                imb: RecA{foo: 321}
            },
            qux: null
        };
    }
}