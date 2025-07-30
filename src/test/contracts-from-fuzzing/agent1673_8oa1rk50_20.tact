struct SFlag {
    flag: Bool;
}

struct SText {
    text: String;
}

contract MultiStructVars {
    sf: SFlag;
    st: SText;

    init() {
        self.sf = SFlag{flag:true};
        self.st = SText{text:"yo"};
    }
}