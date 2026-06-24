struct Mix {
    intVal: Int;
    boolVal: Bool;
    strVal: String;
    optInt: Int?;
    optBool: Bool?;
    optStr: String?;
}

contract TestContract {
    mix: Mix;

    init() {
        self.mix = Mix{
            intVal: 42,
            boolVal: true,
            strVal: "hi",
            optInt: null,
            optBool: false,
            optStr: "hello",
        };
    }
}