struct Blob {
    cellField: Cell;
    sliceField: Slice;
}

contract BlobStorage {
    blob: Blob;

    init() {
        self.blob = Blob {
            cellField: emptyCell(),
            sliceField: emptyCell().asSlice()
        };
    }
}