struct NestedMultiL {
    inner1: Int;
    inner2: Bool;
    inner3: Address;
    inner4: Slice;
}

struct TopNestedMulti {
    dataField: NestedMultiL;
}

contract PersistNestedCombo {
    field: TopNestedMulti;

    init() {
        self.field = TopNestedMulti{
            dataField: NestedMultiL{
                inner1:1, inner2:true, inner3:myAddress(), inner4:emptyCell().asSlice()
            }
        };
    }
}