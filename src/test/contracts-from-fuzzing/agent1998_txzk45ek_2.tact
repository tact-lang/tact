struct Complex {
    intVal: Int;
    boolVal: Bool;
    optInt: Int?;
    optBool: Bool?;
    text: String;
}

contract OptionalNestedTest {
    field: Complex;

    init() {
        self.field = Complex{
            intVal: 9,
            boolVal: false,
            optInt: null,
            optBool: true,
            text: "abc"
        };
    }
}