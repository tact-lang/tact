struct Child {
    id: Int;
    flag: Bool;
}

struct Parent {
    child1: Child;
    child2: Child;
    name: String;
}

contract SeveralStructs {
    data: Parent;

    init() {
        self.data = Parent{
            child1: Child{ id:1, flag:true },
            child2: Child{ id:2, flag:false },
            name: "ok"
        };
    }
}