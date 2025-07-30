// Test struct with persistent-only optionals, no maps
struct OptionalPrims {
    intVal: Int?;
    boolVal: Bool?;
    stringVal: String?;
    cellVal: Cell?;
    addrVal: Address?;
}

contract OptContract {
    data: OptionalPrims = OptionalPrims{
        intVal: null,
        boolVal: null,
        stringVal: null,
        cellVal: null,
        addrVal: null,
    };

    init() {
        self.data = OptionalPrims{
            intVal: 7,
            boolVal: true,
            stringVal: "str",
            cellVal: emptyCell(),
            addrVal: myAddress(),
        };
    }
}