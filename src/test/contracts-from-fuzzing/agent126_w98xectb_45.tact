struct Rec {
    intVal: Int;
    boolVal: Bool;
    strVal: String;
    optInt: Int?;
    optStr: String?;
}

contract RecStruct {
    r: Rec;

    init() {
        self.r = Rec{
            intVal: 1,
            boolVal: true,
            strVal: "ok",
            optInt: null,
            optStr: null
        };
    }
}