struct OptStringStruct {
    maybeStr: String?;
    maybeBool: Bool?;
    intVal: Int;
}

contract OptionalStringFieldTest {
    val: OptStringStruct;

    init() {
        self.val = OptStringStruct{
            maybeStr: null,
            maybeBool: null,
            intVal: 55,
        };
    }
}