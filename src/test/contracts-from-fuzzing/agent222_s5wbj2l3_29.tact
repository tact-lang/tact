struct BigNested {
    v1: Int;
    v2: Int;
    nested: InnerNested;
}

struct InnerNested {
    s1: String?;
    s2: String;
    flag: Bool;
    number: Int?;
}

contract LargeVar {
    data: BigNested;

    init() {
        self.data = BigNested{
            v1:1,
            v2:2,
            nested: InnerNested{
                s1:null,
                s2:"abc",
                flag:true,
                number:10
            }
        };
    }
}