struct D4 { z: Int = 4; }
struct D3 { d4: D4 = D4{}; }
struct D2 { d3: D3 = D3{}; }
struct D1 { d2: D2 = D2{}; }

contract TestContract {
  deeply: D1 = D1{};
}