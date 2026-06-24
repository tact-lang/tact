struct OneString {
    s:String;
}

struct TwoStrings {
    s1:String;
    s2:String;
}

contract ComboPersist {
    a:OneString;
    b:TwoStrings;

    init() {
        self.a=OneString{ s:"hi" };
        self.b=TwoStrings{ s1:"x", s2:"y" };
    }
}