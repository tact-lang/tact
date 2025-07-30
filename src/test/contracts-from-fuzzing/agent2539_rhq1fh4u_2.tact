struct Nested {
    innerBool: Bool;
    innerInt: Int;
}

struct Outer {
    nested: Nested;
    flag: Bool;
}

contract DeepNestedContract {
    storage: Outer;
    
    init() {
        self.storage = Outer{nested: Nested{innerBool: true, innerInt: 123}, flag: false};
    }
}