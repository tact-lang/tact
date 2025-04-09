struct L1 { a: Int; b: Bool?; }
struct L2 { c: L1; d: String?; }
struct L3 { e: L2; f: Bool?; }

contract Layered {
  data: L3 = L3{ e: L2{ c: L1{ a: 5 } } };
}