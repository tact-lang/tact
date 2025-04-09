struct S1 { f1: Int }
struct S2 { f2: Int }

struct MultiLevel {
    one: S1;
    two: S2;
    three: Int;
    four: Bool;
    optInt: Int?;
}

contract Test12 {
    data: MultiLevel;

    init() {
        self.data = MultiLevel{
            one: S1{f1:1},
            two: S2{f2:2},
            three:3,
            four:true,
            optInt:null
        };
    }
}
