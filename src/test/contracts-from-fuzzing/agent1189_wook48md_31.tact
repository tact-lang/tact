struct L4 { val: Int?; }
struct L3 { inner: L4?; }
struct L2 { inner: L3?; }
struct L1 { inner: L2?; }

contract DeepOptNull {
  field: L1 = L1{ inner: null };
}