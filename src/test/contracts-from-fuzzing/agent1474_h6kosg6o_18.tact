struct Serde {
    intVal: Int as uint8;
    boolVal: Bool;
    strVal: String;
}

contract SerdeContract {
    s: Serde;
    init() {
        self.s = Serde{
            intVal: 123,
            boolVal: true,
            strVal: "ok"
        };
    }
}
