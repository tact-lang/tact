// Test of persistence with deeply nested mix optional and non-optionals
struct D1 { a: Int?; b: Bool; }
struct D2 { d1: D1; c: String?; }
struct D3 { d2: D2?; name: String; }

contract DeepMix {
    val: D3 = D3{ d2: null, name: "none" };
    
    init() {
        self.val = D3{
            d2: D2{
                d1: D1{ a: 42, b: true },
                c: "nested"
            },
            name: "init"
        };
    }
}