struct HasBool {
    flag: Bool;
}

struct HasString {
    text: String;
}

struct Mixed {
    intVal: Int;
    boolStruct: HasBool;
    strStruct: HasString;
}

contract MixedNested {
    m: Mixed;

    init() {
        self.m = Mixed{
            intVal: 7,
            boolStruct: HasBool{flag:true},
            strStruct: HasString{text:"test"}
        };
    }
}