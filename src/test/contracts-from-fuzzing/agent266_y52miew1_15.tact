struct Primitives {
    a: Int;
    b: Bool;
    c: Int?;
    d: Bool?;
    e: Address;
    f: String;
    g: Cell;
    h: Slice;
}

struct Wrap1 {
    inner: Primitives;
}

struct Wrap2 {
    inner: Wrap1;
}

contract PrimitiveWrap {
    s: Wrap2;

    init() {
        self.s = Wrap2{
            inner: Wrap1{
                inner: Primitives{
                    a: 1,
                    b: true,
                    c: null,
                    d: false,
                    e: myAddress(),
                    f: "hi",
                    g: emptyCell(),
                    h: emptyCell().asSlice()
                }
            }
        };
    }
}