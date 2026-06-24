struct Inner {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Cell;
    f: Slice;
    g: Int?;
    h: String?;
}

struct Middle {
    inner: Inner;
    flag: Bool;
    txt: String;
}

struct Outer {
    m: Middle;
    id: Int;
}

contract NestedComplex {
    val: Outer;

    init() {
        self.val = Outer{
            m: Middle{
                inner: Inner{
                    a: 1,
                    b: false,
                    c: "hi",
                    d: myAddress(),
                    e: emptyCell(),
                    f: emptyCell().asSlice(),
                    g: null,
                    h: null
                },
                flag: true,
                txt: "yo"
            },
            id: 99
        };
    }
}