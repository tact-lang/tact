struct SerialStruct {
    intVal: Int as uint8;
    boolVal: Bool;
    strVal: String;
}

contract SerialTest {
    data: SerialStruct;

    init() {
        self.data = SerialStruct{
            intVal: 255,
            boolVal: true,
            strVal: "hello",
        };
    }
}