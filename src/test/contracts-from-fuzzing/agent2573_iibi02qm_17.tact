struct StorageRefs {
    refCell: Cell;
    sliceField: Slice;
    nickname: String;
}

contract RefFields {
    data: StorageRefs;

    init() {
        self.data = StorageRefs{
            refCell: emptyCell(),
            sliceField: emptyCell().asSlice(),
            nickname: "Test Account",
        };
    }
}