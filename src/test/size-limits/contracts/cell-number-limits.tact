// giantNestedCell
import "./giant-nested-cell.tact";

message AddCells { number: Int as uint8 }

contract MaxCellNumberTester {
    c1: Cell; c2: Cell; c3: Cell; c4: Cell;
    c5: Cell; c6: Cell; c7: Cell; c8: Cell;
    c9: Cell; c10: Cell; c11: Cell; c12: Cell;
    c13: Cell; c14: Cell; c15: Cell; c16: Cell;
    cExtra: Cell;

    // NOTE: for some reason, Fift's BoC cannot handle neither 2^13 nor 2^12 cells.
    // It just breaks 1k cells short of deserializing each. May be an issue of this wasm fift version (we may need to upgrade it to recently released 2024.09 version)

    /// Setup
    init() {
        self.c1 = giantNestedCell;  // 2^{12} - 2 empty cells
        self.c2 = giantNestedCell;  // 2^{12} - 2 empty cells
        self.c3 = giantNestedCell;  // 2^{12} - 2 empty cells
        self.c4 = giantNestedCell;  // 2^{12} - 2 empty cells
        self.c5 = giantNestedCell;  // 2^{12} - 2 empty cells
        self.c6 = giantNestedCell;  // 2^{12} - 2 empty cells
        self.c7 = giantNestedCell;  // 2^{12} - 2 empty cells
        self.c8 = giantNestedCell;  // 2^{12} - 2 empty cells
        self.c9 = giantNestedCell;  // 2^{12} - 2 empty cells
        self.c10 = giantNestedCell; // 2^{12} - 2 empty cells
        self.c11 = giantNestedCell; // 2^{12} - 2 empty cells
        self.c12 = giantNestedCell; // 2^{12} - 2 empty cells
        self.c13 = giantNestedCell; // 2^{12} - 2 empty cells
        self.c14 = giantNestedCell; // 2^{12} - 2 empty cells
        self.c15 = giantNestedCell; // 2^{12} - 2 empty cells
        self.c16 = giantNestedCell; // 2^{12} - 2 empty cells
        self.cExtra = emptyCell();  // 1 empty cell
        // Overall: 2^{16} - 2^{4} + 1 = 65520 cells
    }

    /// To handle deployment
    receive() {}

    /// To add X cells
    receive(msg: AddCells) {
        let b = beginCell().storeRef(emptyCell());

        // 2 in b, 1 in cExtra already, and X in msg.number, therefore: X - (2 - 1)
        repeat (msg.number - 1) {
            b = beginCell().storeRef(b.endCell());
        }

        self.cExtra = b.endCell();
    }
}
