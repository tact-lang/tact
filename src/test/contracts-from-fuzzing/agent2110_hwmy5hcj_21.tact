// Default-initialized nested struct with optional containing struct
struct Leaf {
    v: Int = 5;
}

struct Container {
    leaf: Leaf;
}

contract NestedDefaults {
    storage: Container?;
    init() {
        self.storage = null;
    }
}