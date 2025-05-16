// Deep persistent variable with fully default-assignable nested chain
struct L3 {
  val: Int = 3;
}

struct L2 {
  inner: L3 = L3{};
}

struct L1 {
  inner: L2 = L2{};
}

contract DeepDefaults {
  v: L1 = L1{};
}