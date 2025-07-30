// maximum nested structure with default values
struct D3 { x: Int = 3 }
struct D2 { d3: D3 = D3{} }
struct D1 { d2: D2 = D2{} }

contract Test {
    val: D1;

    init() {
        self.val = D1{};
    }
}