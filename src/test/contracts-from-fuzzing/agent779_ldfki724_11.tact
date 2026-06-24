struct Combo {
    intVal: Int;
    intOpt: Int?;
    boolVal: Bool;
    boolOpt: Bool?;
    strVal: String;
    strOpt: String?;
}

contract MultiTypes {
    data: Combo;

    init() {
        self.data = Combo{
            intVal: 5,
            intOpt: null,
            boolVal: true,
            boolOpt: false,
            strVal: "hello",
            strOpt: null
        };
    }
}