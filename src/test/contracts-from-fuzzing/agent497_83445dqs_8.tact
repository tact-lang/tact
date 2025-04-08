struct Child {
    val: Int;
    flag: Bool;
    note: String;
}

struct Parent {
    c1: Child;
    c2: Child;
    flag: Bool;
    name: String;
    optChild: Child?;
}

contract Siblings {
    p: Parent;

    init() {
        self.p = Parent{
            c1: Child{val:1,flag:true,note:"c1"},
            c2: Child{val:2,flag:false,note:"c2"},
            flag:true,
            name:"parent",
            optChild:null
        };
    }
}