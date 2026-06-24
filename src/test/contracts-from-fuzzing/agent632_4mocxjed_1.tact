struct Nested {
    value: Int?;
}

struct Outer {
    nested: Nested;
    flag: Bool;
}

contract TestContract {
    data: Outer;
    
    init() {
        self.data = Outer{nested: Nested{value: null}, flag: false};
    }
}