struct OptionalsComplex {
    intVal: Int?;
    boolVal: Bool?;
    addrVal: Address?;
    cellVal: Cell?;
}

contract TestContract {
    state: OptionalsComplex;

    init() {
        self.state = OptionalsComplex{
            intVal: null,
            boolVal: null,
            addrVal: null,
            cellVal: null
        };
    }
}