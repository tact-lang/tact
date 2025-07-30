struct L1  { x: Int = 1; }
struct L2  { x: L1 = L1{}; }
struct L3  { x: L2 = L2{}; }
struct L4  { x: L3 = L3{}; }
struct L5  { x: L4 = L4{}; }
struct L6  { x: L5 = L5{}; }
struct L7  { x: L6 = L6{}; }
struct L8  { x: L7 = L7{}; }
struct L9  { x: L8 = L8{}; }
struct L10 { x: L9 = L9{}; }

contract Deep10Nest {
    x: L10 = L10{};
}
