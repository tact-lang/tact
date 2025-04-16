struct Child {
    a: Int;
    b: Int?;
    c: Bool?;
}

struct Parent {
    child1: Child;
    child2: Child;
    num: Int;
}

contract StorageTest {
    val: Parent;

    init() {
        self.val = Parent{
            child1: Child{a:1,b:null,c:true},
            child2: Child{a:2,b:5,c:null},
            num: 42
        };
    }
}