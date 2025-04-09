struct Nested {
    x: Int;
    y: Bool;
    z: String?;
}

struct Wrapper {
    nested: Nested;
    another: Int?;
}

contract Test2 {
    store: Wrapper;
    init() {
        self.store = Wrapper{
            nested: Nested{x: 3, y: false, z: null},
            another: null
        };
    }
}