struct BigFields {
    txt: String;
    blob: Cell;
}

contract TestContract {
    data: BigFields;

    init() {
        self.data = BigFields{
            txt: "hello world",
            blob: emptyCell()
        };
    }
}
