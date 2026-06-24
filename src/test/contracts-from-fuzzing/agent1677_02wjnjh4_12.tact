contract ZeroDefaults {
    int0: Int=0;
    int1: Int=1;
    intNeg: Int=-1;
    flagTrue: Bool=true;
    flagFalse: Bool=false;
    strEmpty: String="";
    strSome: String="HI";

    init() {
        self.int0=99;
        self.flagFalse=true;
        self.strEmpty="hello";
    }
}
