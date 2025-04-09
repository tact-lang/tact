struct Mix {
    intVal: Int as uint8;
    optBool: Bool? = true;
    message: String = "deep test";
}

contract MixPersist {
    data: Mix;

    init() {
        self.data = Mix{
            intVal: 42
        };
    }
}