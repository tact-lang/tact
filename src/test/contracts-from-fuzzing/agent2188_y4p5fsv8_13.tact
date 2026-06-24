struct EmptyOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
}

struct MoreOptionals {
    s1: EmptyOptionals;
    s2: EmptyOptionals;
    s3: EmptyOptionals;
}

contract ManyNulls {
    nested: MoreOptionals;
    init() {
        self.nested = MoreOptionals{
            s1: EmptyOptionals{a:null,b:null,c:null},
            s2: EmptyOptionals{a:null,b:null,c:null},
            s3: EmptyOptionals{a:null,b:null,c:null},
        };
    }
}