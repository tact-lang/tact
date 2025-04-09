struct BigNested {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Slice;
    f: Address;
    g: Int?;
    h: Bool?;
    i: String?;
}

struct OuterStruct {
    inner: BigNested;
    k: Int;
}

contract TestContract {
    data: OuterStruct;

    init() {
        self.data = OuterStruct{
            inner: BigNested{
                a: 1,
                b: true,
                c: "abc",
                d: emptyCell(),
                e: emptyCell().asSlice(),
                f: myAddress(),
                g: null,
                h: null,
                i: null,
            },
            k: 42,
        };
    }
}