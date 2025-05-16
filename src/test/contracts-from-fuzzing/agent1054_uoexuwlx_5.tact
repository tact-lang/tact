contract TestContract {
    big: BigStruct;

    init() {
        self.big = BigStruct{
            foo: 1,
            bar: 2,
            baz: 3,
            qux: 4,
            quux: 5,
            corge: 6,
            grault: 7,
            garply: 8,
            waldo: 9,
            fred: 10,
            plugh: 11,
            xyzzy: 12,
            thud: 13,
            extra: 14
        };
    }
}

struct BigStruct {
    foo: Int;
    bar: Int;
    baz: Int;
    qux: Int;
    quux: Int;
    corge: Int;
    grault: Int;
    garply: Int;
    waldo: Int;
    fred: Int;
    plugh: Int;
    xyzzy: Int;
    thud: Int;
    extra: Int;
}