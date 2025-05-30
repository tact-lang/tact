struct IntStringBool {
    number: Int;
    text: String;
    flag: Bool;
}

contract AllTypesNested {
    a: IntStringBool;
    b: IntStringBool;

    init() {
        self.a = IntStringBool { number:1, text:"one", flag:true };
        self.b = IntStringBool { number:2, text:"two", flag:false };
    }
}