struct Rec {
    value: Int;
}

contract Combine {
    intVal: Int;
    flag: Bool;
    txt: String;
    optInt: Int?;
    optBool: Bool?;
    optStr: String?;
    s: Rec;
    optS: Rec?;

    init() {
        self.intVal = 1;
        self.flag = true;
        self.txt = "hello";
        self.optInt = null;
        self.optBool = false;
        self.optStr = null;
        self.s = Rec{value:5};
        self.optS = null;
    }
}
