struct SubStruct {
    a: Int;
    b: Bool;
    c: String;
}

contract ComboData {
    val1: Int;
    val2: Bool;
    val3: String;
    s: SubStruct;
    optSub: SubStruct?;
    init() {
        self.val1 = 1;
        self.val2 = true;
        self.val3 = "x";
        self.s = SubStruct{a:2,b:false,c:"y"};
        self.optSub = null;
    }
}