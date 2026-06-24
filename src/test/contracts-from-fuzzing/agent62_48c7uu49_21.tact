struct Blob {
    id: Int;
    payload: Slice as remaining;
}

contract Test21 {
    blob: Blob;
    init() {
        self.blob = Blob{
            id: 999,
            payload: emptyCell().asSlice()
        };
    }
}