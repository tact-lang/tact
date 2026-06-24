struct PartA {
    x: Int;
    tail: Slice as remaining;
}

struct PartB {
    y: Int;
    excess: Cell as remaining;
}

struct Composite {
    a: PartA;
    b: PartB;
}

contract TestContract {
    cmp: Composite;

    init() {
        self.cmp = Composite{
            a: PartA{ x: 1, tail: emptyCell().asSlice() },
            b: PartB{ y: 2, excess: emptyCell() },
        };
    }
}