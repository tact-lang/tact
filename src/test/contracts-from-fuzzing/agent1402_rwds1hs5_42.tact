struct HasTrailingCell {
    name: String;
    rest: Cell as remaining;
}

contract RestTrailingCell {
    a: HasTrailingCell;

    init() {
        self.a = HasTrailingCell{ name: "name", rest: emptyCell() };
    }
}