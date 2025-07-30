struct Nested {
    level1: Int;
    optLevel2: Inner?;
}

struct Inner {
    value: Int;
}

contract TestContract {
    data: Nested;
    
    init() {
        self.data = Nested{
            level1: 1,
            optLevel2: Inner{ value: 2 }
        };
    }
}