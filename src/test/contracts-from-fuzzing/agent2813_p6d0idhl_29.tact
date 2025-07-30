struct DeepNestWide {
    lvl1: Nest1;
    lvl2: Nest2;
}

struct Nest1 {
    x: Int;
    y: String;
}

struct Nest2 {
    flag: Bool;
    inn: InnerNest;
}

struct InnerNest {
    s: String;
    n: Int;
}

contract TestDeepNestWide {
    store: DeepNestWide;
    init() {
        self.store= DeepNestWide{
            lvl1: Nest1{x:1,y:"a"},
            lvl2: Nest2{flag:true,inn:InnerNest{s:"b",n:2}}
        };
    }
}
