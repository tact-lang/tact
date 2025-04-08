struct SOpt {
    a: Int?;
    b: Bool?;
    c: String?;
}

struct NestOpt {
    s1: SOpt;
    s2: SOpt;
}

contract ManyNestedOptionals {
    n: NestOpt;
    init() {
        self.n = NestOpt{
            s1: SOpt{ a:null, b:null, c:null },
            s2: SOpt{ a:null, b:true, c:"" }
        };
    }
}