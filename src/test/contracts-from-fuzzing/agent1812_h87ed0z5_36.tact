// Test optional nested struct inside deeply wrapped
struct Leaf {
    value: Int;
}

struct Wrapper {
    leaf: Leaf?;
}

contract DeepOptionalLeaf {
    data: Wrapper;

    init() {
        self.data = Wrapper { leaf:null };
    }
}