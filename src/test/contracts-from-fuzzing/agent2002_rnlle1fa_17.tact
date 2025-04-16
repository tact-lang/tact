struct Child {
    num: Int;
    word: String;
    flag: Bool;
}

struct Parent {
    child1: Child;
    child2: Child;
    optionalChild: Child?;
}

contract FamilyTree {
    state: Parent;

    init() {
        self.state = Parent{
            child1: Child{num:1,word:"A",flag:true},
            child2: Child{num:2,word:"B",flag:false},
            optionalChild: null
        };
    }
}
