struct Outer {
    nested: Inner; 
}

struct Inner {
    field: Int?; 
}

contract NestedOptField {
    val: Outer;
    init() {
        self.val = Outer{
            nested: Inner{ field: null }
        };
    }
}