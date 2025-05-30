struct OptionalStruct {
    value: Int?;
    label: String?;
    cellref: Cell?;
}

contract TestContract {
    s: OptionalStruct;
    init() {
        self.s = OptionalStruct{
            value: 42,
            label: null,
            cellref: emptyCell(),
        };
    }
}