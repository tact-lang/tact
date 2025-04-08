struct Leaf {
    data: Int?;
}

struct Middle {
    leaf: Leaf?;
}

struct Root {
    middle: Middle?;
}

contract TestContract {
    root: Root;
    
    init() {
        self.root = Root{
            middle: null
        };
    }
}