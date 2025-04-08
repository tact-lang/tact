struct Mix {
    intVal: Int;
    boolVal: Bool;
    strVal: String;
    intOpt: Int?;
    boolOpt: Bool?;
    strOpt: String?;
}

contract MixedStructStore {
    store: Mix;
    init() {
        self.store = Mix{
            intVal: 123,
            boolVal: true,
            strVal: "txt",
            intOpt: null,
            boolOpt: false,
            strOpt: null
        };
    }
}