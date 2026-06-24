struct Mix {
    intVal: Int;
    boolVal: Bool;
    strVal: String;
    optVal: Int?;
}

contract StructMix {
    data: Mix;

    init() {
        self.data = Mix{
            intVal: 1,
            boolVal: true,
            strVal: "hello",
            optVal: null
        };
    }
}