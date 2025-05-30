struct MiddleLevel {
    a: Int;
    b: Bool?;
}

struct TopLevel {
    m1: MiddleLevel;
    m2: MiddleLevel;
    val: Int?;
}

contract NestedStructs {
    data: TopLevel;

    init() {
        self.data = TopLevel{
            m1: MiddleLevel{a:1,b:null},
            m2: MiddleLevel{a:2,b:true},
            val: null
        };
    }
}