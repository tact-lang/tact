struct Combinations {
    i: Int;
    s: String?;
    b: Bool;
    o: Address?;
    c: Cell;
}

contract ComboFinalTest {
    val: Combinations;

    init() {
        self.val = Combinations{
            i: 777,
            s: null,
            b: true,
            o: null,
            c: emptyCell(),
        };
    }
}