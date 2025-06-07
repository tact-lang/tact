struct Text {
    s: String;
}

struct Flag {
    b: Bool;
}

struct Num {
    n: Int;
}

contract Mix {
    t: Text;
    f: Flag;
    n: Num;
    bo: Bool?;
    strOpt: String?;
    intOpt: Int?;

    init() {
        self.t = Text{s:"abc"};
        self.f = Flag{b:true};
        self.n = Num{n:42};
        self.bo = false;
        self.strOpt = "xyz";
        self.intOpt = null;
    }
}
// persistent fields mix of nested structs + optionals