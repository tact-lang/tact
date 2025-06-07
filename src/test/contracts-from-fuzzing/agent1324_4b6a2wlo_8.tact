struct Child {
    val1: Int;
    val2: Bool;
    val3: String;
}

struct Parent {
    child1: Child;
    child2: Child;
}

contract NestedMany {
    nestedData: Parent;

    init() {
        self.nestedData = Parent{
            child1: Child{val1:1,val2:true,val3:"a"},
            child2: Child{val1:2,val2:false,val3:"b"}
        };
    }
}