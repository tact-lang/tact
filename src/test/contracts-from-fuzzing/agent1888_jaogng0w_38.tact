struct Test {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Address;
    f5: Cell;
    f6: Int?;
    f7: Bool?;
    f8: String?;
    f9: Address?;
    f10: Cell?;
}

contract PersistTest {
    dat: Test;

    init() {
        self.dat = Test {
            f1: 10,
            f2: true,
            f3: "s",
            f4: myAddress(),
            f5: emptyCell(),
            f6: null,
            f7: null,
            f8: null,
            f9: null,
            f10: null
        };
    }
}
