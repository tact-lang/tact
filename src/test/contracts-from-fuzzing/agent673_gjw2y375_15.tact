// struct with long sequence of primitive fields
struct ManyPrimitives {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Cell;
    f: String;
    g: Int;
    h: Bool;
    i: Cell;
    j: Address;
    k: Int;
    l: Bool;
    m: String;
    n: Address;
    o: Cell;
}

contract TestContract {
    mp: ManyPrimitives;

    init() {
        self.mp = ManyPrimitives{
            a: 1,
            b: false,
            c: "x",
            d: myAddress(),
            e: emptyCell(),
            f: "y",
            g: 7,
            h: true,
            i: emptyCell(),
            j: myAddress(),
            k: 8,
            l: false,
            m: "z",
            n: myAddress(),
            o: emptyCell()
        };
    }
}