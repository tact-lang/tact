struct Child {
    x: Int = 1;
    y: Int?; // implicitly null
}

struct Parent {
    c1: Child;            
    c2: Child?; // optional struct, initially null
}

contract NestedStorage {
    data: Parent;

    init() {
        self.data = Parent{
            c1: Child{ x: 7, y: 8 },
            c2: Child{ x: 9, y: null }
        };
    }

    receive() {}
}