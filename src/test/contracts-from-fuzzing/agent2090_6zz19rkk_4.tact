struct InnerStruct {
    p: Int;
    q: Cell;
    r: String?;
    s: Bool;
    t: Slice?;
}

struct OuterStruct {
    a: InnerStruct;
    b: Int;
    c: Bool?;
    d: String;
}

contract NestTest {
    data: OuterStruct;

    init() {
        self.data = OuterStruct{
            a: InnerStruct{
                p: 123,
                q: emptyCell(),
                r: null,
                s: true,
                t: null,
            },
            b: 42,
            c: null,
            d: "test"
        };
    }
}