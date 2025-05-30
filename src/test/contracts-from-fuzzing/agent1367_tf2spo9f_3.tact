struct S {
    f1: Int;
    f2: String;
    f3: Bool;
    f4: Cell;
    f5: Address;
    f6: Int?;
    f7: String?;
}

contract Storage {
    s: S;

    init() {
        self.s = S{
            f1: 10,
            f2: "Hello",
            f3: true,
            f4: emptyCell(),
            f5: myAddress(),
            f6: null,
            f7: null
        };
    }
}