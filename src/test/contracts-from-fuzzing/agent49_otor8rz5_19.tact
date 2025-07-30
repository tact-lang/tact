struct ContainsSlice {
    cellData: Slice;
    id: Int;
}

contract TestContract {
    data: ContainsSlice;

    init() {
        self.data = ContainsSlice{
            cellData: emptyCell().asSlice(),
            id: 321,
        };
    }
}
