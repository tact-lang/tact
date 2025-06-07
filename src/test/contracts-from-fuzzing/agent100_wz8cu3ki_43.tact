struct Varying {
    i: Int;
    b: Bool;
    s: String;
    a: Address;
    c: Cell;
}

contract Test44 {
    dat: Varying;

    init() {
        self.dat = Varying{
            i: 1,
            b: true,
            s: "abc",
            a: myAddress(),
            c: emptyCell()
        };
    }
}