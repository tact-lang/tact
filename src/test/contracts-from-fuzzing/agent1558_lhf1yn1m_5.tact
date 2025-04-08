struct Child {
    aa: Int;
    bb: Bool;
    cc: Int?;
}

struct Parent {
    child1: Child;
    child2: Child;
    d: Bool;
    e: Int?;
    f: Bool?;
}

contract TestContract {
    value: Parent;
    
    init() {
        self.value = Parent{
            child1: Child{ aa:1, bb:true, cc:null },
            child2: Child{ aa:2, bb:false, cc:null },
            d: false,
            e: null,
            f: null,
        };
    }
}
