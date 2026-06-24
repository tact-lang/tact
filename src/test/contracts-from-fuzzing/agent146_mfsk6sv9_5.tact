struct Child {
    value: Int;
    opt: Bool?;
}

struct Root {
    child1: Child;
    child2: Child;
    flag: Bool;
}

contract Multi {
    storage: Root = Root{
        child1: Child{ value: 10, opt:true },
        child2: Child{ value: 20, opt:null },
        flag: false
    };
}