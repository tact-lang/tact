// Test deeply nested optional structs with mixed default values
struct DeepC {
    flag: Bool? = null;
}

struct DeepB {
    c: DeepC? = null;
}

struct DeepA {
    b: DeepB? = null;
}

contract Test {
    val: DeepA;

    init() {
        self.val = DeepA{};
    }
}