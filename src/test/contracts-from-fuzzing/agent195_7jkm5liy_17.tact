struct All {
    intVal: Int;
    boolVal: Bool;
    strVal: String;
    oInt: Int?;
    oBool: Bool?;
    oStr: String?;
}

contract Variety {
    d: All;

    init() {
        self.d = All{
            intVal: 1,
            boolVal: false,
            strVal: "abc",
            oInt: null,
            oBool: true,
            oStr: null
        };
    }
}
