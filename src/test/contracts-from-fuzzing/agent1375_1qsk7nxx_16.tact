struct BigNested {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Cell;
    f: Slice;
    g: Builder;
}

struct Container {
    nested: BigNested;
    s: String;
    flag: Bool;
}

contract Combined {
    rec: Container;

    init() {
        self.rec = Container{
            nested: BigNested{
                a: 1,
                b: true,
                c: "str",
                d: myAddress(),
                e: emptyCell(),
                f: emptyCell().asSlice(),
                g: beginCell(),
            },
            s: "test",
            flag: false,
        };
    }
}