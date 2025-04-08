struct Rec {
    intVal: Int;
    boolVal: Bool;
    strVal: String;
}

contract DefaultsOverrideTest {
    data: Rec;

    init() {
        self.data = Rec{
            intVal: 42,
            boolVal: false,
            strVal: "test",
        };
    }
}