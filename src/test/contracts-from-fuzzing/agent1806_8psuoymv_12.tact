struct Mix {
    optInt: Int?;
    optBool: Bool?;
    optAddr: Address?;
    defStr: String = "hi";
    intVal: Int;
}

contract MixTest {
    field: Mix;
    init() {
        self.field = Mix{
            optInt: null,
            optBool: false,
            optAddr: null,
            intVal: 99
        };
    }
}