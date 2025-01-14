trait BaseTrait { }

primitive Int;
primitive Cell;

contract Test {
    a: Int = 0;
    s: Cell as remaining;
    b: Int = 0;

    init(cell: Cell) {
        self.s = cell;
    }
}
