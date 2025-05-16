struct Child {
    a: Int?;
    b: Bool;
}

struct Parent {
    x: Int;
    y: Child?;
}

contract Optionals {
    data: Parent?;
    
    init() {
        self.data = Parent{
            x: 42,
            y: null
        };
    }
}