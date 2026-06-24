struct SubSub {
    inner_flag: Bool;
}

struct Sub {
    subsub: SubSub;
    value: Int;
}

struct TopLevel {
    sub1: Sub;
    sub2: Sub;
}

contract TestContract {
    data: TopLevel;

    init() {
        self.data = TopLevel{
            sub1: Sub{subsub: SubSub{inner_flag:true}, value:1},
            sub2: Sub{subsub: SubSub{inner_flag:false}, value:2}
        };
    }
}
