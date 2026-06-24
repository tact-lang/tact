struct Child {
    a: Int;
    b: Bool;
    c: String;
}

struct Parent {
    f1: Child;
    f2: Child;
    f3: Child;
}

contract Test {
    storage: Parent;

    init() {
        self.storage = Parent{
            f1: Child{a:1,b:true,c:"x"},
            f2: Child{a:2,b:false,c:"y"},
            f3: Child{a:3,b:true,c:"z"}
        };
    }
}
