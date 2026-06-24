// deeply nested optional structs with all defaults
struct D4 { a: Int? = null; }
struct D3 { d4: D4? = null; }
struct D2 { d3: D3? = null; }
struct D1 { d2: D2? = null; }

contract DeepDefaultNest {
    root: D1;

    init() {
        self.root = D1{};
    }
}