struct Blob {
    data: Cell;
    txt: String;
}

contract CellAndString {
    f: Blob;

    init() {
        self.f = Blob{
            data: emptyCell(),
            txt: "datafield",
        };
    }
}