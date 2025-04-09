const ConstantCell: Cell = "hello world".asComment();

contract AsCommentTester {
    receive() {}

    get fun constantCell(): Cell {
        return ConstantCell;
    }

    get fun asCommentRuntimeCell(val: String): Cell {
        return val.asComment();
    }
}
