struct Big1 {
    a: Int;
    b: Bool;
    c: String;
}

struct Big2 {
    d: Address;
    e: Cell;
    f: Slice;
}

struct Combo {
    p: Big1;
    q: Big2;
    r: Bool?;
    s: String?;
    t: Int as uint32;
}

contract Test8 {
    state: Combo;

    init() {
        self.state = Combo{
            p: Big1{
                a: 10,
                b: true,
                c: "hi"
            },
            q: Big2{
                d: myAddress(),
                e: emptyCell(),
                f: emptyCell().asSlice()
            },
            r: null,
            s: "opt",
            t: 123
        };
    }
}