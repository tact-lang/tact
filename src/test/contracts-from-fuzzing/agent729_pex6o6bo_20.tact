struct Mix {
    intVal: Int;
    boolVal: Bool?;
    strVal: String;
    adrVal: Address?;
    celVal: Cell;
    sliVal: Slice?;
    bldVal: Builder;
}

contract MixedTypes {
    data: Mix;

    init() {
        self.data = Mix{
            intVal: 12,
            boolVal: null,
            strVal: "data",
            adrVal: null,
            celVal: emptyCell(),
            sliVal: null,
            bldVal: beginCell(),
        };
    }

    receive() {}
}