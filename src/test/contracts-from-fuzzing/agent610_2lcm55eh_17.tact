// Very deep nesting with mix of optionals and defaults
struct D4 { v4: Int = 4; }
struct D3 { v3: D4? = null; }
struct D2 { v2: D3 = D3{}; }
struct D1 { v1: D2? = null; }

contract DeepDefaults {
    x: D1;

    init() {
        self.x = D1{v1:null};
    }
}