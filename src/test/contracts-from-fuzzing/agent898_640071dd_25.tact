struct SubS {
    a: Int;
    b: Bool;
}

struct SuperS {
    s1: SubS;
    s2: SubS;
    optOther: SubS?;
}

contract NestDupOpt {
    val: SuperS;

    init() {
        self.val = SuperS{
            s1: SubS{a:1,b:true},
            s2: SubS{a:2,b:false},
            optOther: null,
        };
    }
}
