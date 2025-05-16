struct Mix {
    sa: String;
    inta: Int;
    boola: Bool;
    optstr: String?;
    optint: Int?;
    optbool: Bool?;
    cella: Cell;
    slicea: Slice;
    adda: Address;
}

contract MixedTypes {
    data: Mix;
    init() {
        self.data = Mix{
            sa: "hi",
            inta: 1,
            boola: true,
            optstr: null,
            optint: null,
            optbool: false,
            cella: emptyCell(),
            slicea: emptySlice(),
            adda: myAddress(),
        };
    }
}