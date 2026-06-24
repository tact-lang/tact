struct Child {
    one: Int;
    two: String;
    three: Bool;
}

struct Parent {
    child1: Child;
    child2: Child;
    child3: Child;
}

contract RepeatingStructs {
    data: Parent;

    init() {
        self.data = Parent{
            child1: Child{one:1,two:"a",three:true},
            child2: Child{one:2,two:"b",three:false},
            child3: Child{one:3,two:"c",three:true}
        };
    }
}