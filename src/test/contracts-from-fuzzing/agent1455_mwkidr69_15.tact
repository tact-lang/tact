struct InnerList {
    one: Int;
    two: Int;
}

struct Middle {
    nested1: InnerList;
    nested2: InnerList;
    nested3: InnerList;
}

contract WideNested {
    s: Middle;

    init() {
        self.s = Middle{
            nested1: InnerList{one:1,two:2},
            nested2: InnerList{one:3,two:4},
            nested3: InnerList{one:5,two:6},
        };
    }
}
