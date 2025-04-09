// Nested optional structs with mixed optionals inside
struct Sub {
    a: Int;
    b: Bool?;
}

struct Container {
    s: Sub?;
}

contract Test {
    val: Container;
    init() {
        self.val = Container{
            s: Sub{ a: 1, b: null }
        };
    }
}