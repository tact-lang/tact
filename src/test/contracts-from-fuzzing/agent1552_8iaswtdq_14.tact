struct SubStruct {
    val: Int;
    text: String;
    flag: Bool?;
}

contract NestedFields {
    sub: SubStruct;
    val: Int;
    text: String;
    optBool: Bool?;

    init() {
        self.sub = SubStruct{val:1, text:"abc", flag:null};
        self.val = 2;
        self.text = "def";
        self.optBool = true;
    }
}