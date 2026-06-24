struct MixTypes {
    intVal: Int;
    boolVal: Bool;
    addrVal: Address;
    strVal: String;
    cellVal: Cell;
}

contract ContractMixStruct {
    mixed: MixTypes;

    init() {
        self.mixed = MixTypes{
            intVal: 1,
            boolVal: false,
            addrVal: myAddress(),
            strVal: "hi",
            cellVal: emptyCell()
        };
    }
}