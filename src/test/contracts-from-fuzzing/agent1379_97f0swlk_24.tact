struct OptionalStringCells {
    name: String?;
    data: Cell?;
}

contract OptStrCellsTest {
    s: OptionalStringCells;

    init() {
        self.s = OptionalStringCells{
            name: null,
            data: null
        };
    }
}
