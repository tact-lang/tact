struct BigNested {
    a: Int;
    b: String?;
    c: Cell;
    d: Slice;
    e: Address;
    f: Bool;
}

struct Wrap1 { inner: BigNested; }
struct Wrap2 { inner: Wrap1; }
struct Wrap3 { inner: Wrap2; }

contract BiggerNest {
    storage: Wrap3;

    init() {
        self.storage = Wrap3{
            inner: Wrap2{
                inner: Wrap1{
                    inner: BigNested{
                        a: 7,
                        b: null,
                        c: emptyCell(),
                        d: emptyCell().asSlice(),
                        e: myAddress(),
                        f: true
                    }
                }
            }
        };
    }
}