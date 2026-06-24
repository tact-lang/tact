struct IntAndStrings {
    a: Int;
    b: String;
    c: String?;
}

contract IntStrStruct {
    s: IntAndStrings;

    init() {
        self.s = IntAndStrings{ a: 1, b: "hello", c:null};
    }
}
