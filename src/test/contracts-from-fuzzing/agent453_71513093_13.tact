struct Outer {
    field1: Int;
    nested: Middle;
}

struct Middle {
    flag: Bool;
    nestedAgain: InnerMost;
}

struct InnerMost {
    v: Int;
}

contract TestContract {
    sss: Outer;
    init() {
        self.sss = Outer{
            field1:17,
            nested: Middle{
                flag:true,
                nestedAgain: InnerMost{ v:999 }
            }
        };
    }
}