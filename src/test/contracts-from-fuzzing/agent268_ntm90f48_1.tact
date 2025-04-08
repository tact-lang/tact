struct Nested {
    deepOpt: MyStruct?;
}

struct MyStruct {
    a: Int;
    b: Bool?;
}

contract TestContract {
    nested: Nested;
    
    init() {
        self.nested = Nested{ deepOpt: null };
    }
}