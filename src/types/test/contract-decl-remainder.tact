trait BaseTrait { }

primitive Int;
primitive Cell;

contract Test {
    a: Int = 0;
    b: Int = 0;
    s: Cell as remaining;

    init(cell: Cell) {
        self.s = cell;
    }
}
