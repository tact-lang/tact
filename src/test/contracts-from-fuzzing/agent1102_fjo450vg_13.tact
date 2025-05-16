// Test optional nested struct with null
struct LeafStruct {
    x: Int;
}

struct ParentOptional {
    child: LeafStruct?;
}

contract NullNestedOptional {
    data: ParentOptional;

    init() {
        self.data = ParentOptional{ child: null };
    }
}
