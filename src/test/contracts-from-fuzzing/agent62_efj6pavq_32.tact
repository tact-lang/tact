struct NestedRem {
    a: Int;
    b: Cell as remaining;
}

contract WithRemaining {
    data: NestedRem;

    init() {
        self.data = NestedRem{
            a:5,
            b: emptyCell()
        };
    }
}