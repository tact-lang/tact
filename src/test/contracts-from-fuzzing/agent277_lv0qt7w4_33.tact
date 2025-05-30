struct Mix {
    intVal: Int;
    boolVal: Bool;
    strVal: String;
    optInt: Int?;
    optBool: Bool?;
}
contract Test {
    m: Mix;
    init() {
        self.m = Mix{
            intVal: 42,
            boolVal: true,
            strVal: "test",
            optInt: null,
            optBool: false
        };
    }
}