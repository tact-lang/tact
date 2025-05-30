struct Combined {
    intVal: Int;
    strVal: String;
    boolVal: Bool;
    optInt: Int?;
    optStr: String?;
}

contract ComboFields {
    data: Combined;

    init() {
        self.data = Combined{
            intVal: 5,
            strVal: "test",
            boolVal: true,
            optInt: null,
            optStr: null
        };
    }
}