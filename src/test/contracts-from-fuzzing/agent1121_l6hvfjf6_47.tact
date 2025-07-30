// deeply nested optional Cell inside structs
struct CellLeaf { c: Cell? }
struct CellMid { leaf: CellLeaf? }
struct CellRoot { mid: CellMid? }

contract NestedOptionalCell {
    state: CellRoot;

    init() {
        self.state = CellRoot{mid:null};
    }
}