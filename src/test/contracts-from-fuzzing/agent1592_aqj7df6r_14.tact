struct CellNested1 { cell: Cell; }
struct CellNested2 { inner: CellNested1; }
struct CellNested3 { inner: CellNested2; }

contract CellDeepNest {
    storage: CellNested3;

    init() {
        self.storage = CellNested3{
            inner: CellNested2{
                inner: CellNested1{
                    cell: emptyCell()
                }
            }
        };
    }
}