struct MinorNode {
    flag: Bool?;
    desc: String?;
}

struct OptionalCells {
    maybeCell: Cell?;
    maybeSlice: Slice?;
    node: MinorNode;
}

contract OptionalCellsContract {
    store: OptionalCells;

    init() {
        self.store = OptionalCells{
            maybeCell: null,
            maybeSlice: emptyCell().asSlice(),
            node: MinorNode{
                flag: true,
                desc: null
            }
        };
    }
}