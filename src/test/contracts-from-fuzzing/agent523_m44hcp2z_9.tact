struct BoolNest {
    b1: Bool;
    b2: Bool?;
    b3: Bool;
}

struct TextNest {
    str1: String;
    str2: String?;
}

struct Mixed {
    bools: BoolNest;
    texts: TextNest;
    intVal: Int;
    optInt: Int?;
}

contract MixedFields {
    data: Mixed;

    init() {
        self.data = Mixed{
            bools: BoolNest{b1: true, b2: null, b3: false},
            texts: TextNest{str1: "hi", str2: "yo"},
            intVal: 999,
            optInt: null
        };
    }
}
