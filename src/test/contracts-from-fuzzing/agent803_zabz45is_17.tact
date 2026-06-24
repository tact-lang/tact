struct Holder {
    intVal: Int;
    optBool: Bool?;
    strVal: String;
    optString: String?;
}

contract VariousOptionals {
    data: Holder;

    init() {
        self.data = Holder{
            intVal: 55,
            optBool: null,
            strVal: "hello",
            optString: null
        };
    }
}