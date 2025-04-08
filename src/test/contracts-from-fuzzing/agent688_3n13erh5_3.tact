struct LargeTuple {
    a: Int;
    b: Int;
    c: Bool;
    d: String;
    e: Cell;
    f: Bool;
    g: Int;
    h: Cell;
    i: String;
    j: Bool;
}

contract TestContract {
    data: LargeTuple;

    init() {
        self.data = LargeTuple{
            a: 1,
            b: 2,
            c: true,
            d: "hello",
            e: emptyCell(),
            f: false,
            g: 42,
            h: emptyCell(),
            i: "world",
            j: true,
        };
    }
}