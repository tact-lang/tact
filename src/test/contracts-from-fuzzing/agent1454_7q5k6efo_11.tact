struct Reordered {
    b: Bool;
    n: Int as uint4;
    s: String;
    c: Cell;
}

contract FieldsOrderTest {
    o: Reordered;

    init() {
        self.o = Reordered{
            b: true,
            n: 8,
            s: "x",
            c: emptyCell()
        };
    }

    receive() {
        let _ = self.o.c;
    }
}