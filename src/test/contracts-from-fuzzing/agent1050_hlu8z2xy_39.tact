struct OptStr {
    a: String?;
    b: String?;
    c: String?;
}

contract OptManyStrings {
    s: OptStr;

    init() {
        self.s = OptStr{a:null,b:null,c:null};
    }
}
