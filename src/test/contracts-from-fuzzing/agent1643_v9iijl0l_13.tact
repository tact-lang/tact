struct Combo {
    intVal: Int;
    boolVal: Bool;
    optionalInt: Int?;
    optionalBool: Bool?;
    text: String;
}

contract MixedFieldsContract {
    myData: Combo;

    init() {
        self.myData = Combo{
            intVal: 5,
            boolVal: true,
            optionalInt: null,
            optionalBool: null,
            text: "hi"
        };
    }
}
