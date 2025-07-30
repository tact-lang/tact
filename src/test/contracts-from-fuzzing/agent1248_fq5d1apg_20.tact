struct Blob {
    data: Cell;
    info: String;
    extra: Cell;
}

contract CellBlob {
    b: Blob;

    init() {
        self.b = Blob{data:emptyCell(), info:"msg", extra:emptyCell()};
    }
}
