struct OptionalHolder {
    intVal: Int?;
    boolVal: Bool?;
    strVal: String?;
    sliceVal: Slice?;
}

contract OptionalTest {
    stored: OptionalHolder;

    init() {
        self.stored = OptionalHolder{
            intVal: null,
            boolVal: true,
            strVal: null,
            sliceVal: null,
        };
    }

    receive() {
        self.stored = self.stored;
    }
}