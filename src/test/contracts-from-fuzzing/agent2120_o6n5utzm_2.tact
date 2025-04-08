struct Nested2 {
    x: Int;
    y: Int?;
    z: Bool;
}

struct Nested1 {
    n2: Nested2;
    q: String?;
}

contract DeepStructOptional {
    storage: Nested1?;

    init() {
        self.storage = null;
    }
}