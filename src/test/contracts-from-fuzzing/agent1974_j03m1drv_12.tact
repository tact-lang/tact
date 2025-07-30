struct Sibling {
    alpha: Int;
    beta: Int?;
}

struct Parent {
    left: Sibling;
    right: Sibling;
    done: Bool;
}

contract SiblingTest {
    storage: Parent;
    
    init() {
        self.storage = Parent{
            left: Sibling{ alpha:1, beta:null },
            right: Sibling{ alpha:2, beta:3 },
            done: true
        };
    }
}
