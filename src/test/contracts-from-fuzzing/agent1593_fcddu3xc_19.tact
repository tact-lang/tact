// Struct with optional nested struct containing optional fields
struct Leaf {
    x: Int?;
    y: Bool?;
}

struct Middle {
    inner: Leaf?;
}

contract NestedOptTest {
    data: Middle;

    init() {
        self.data = Middle{ inner: null };
    }
}