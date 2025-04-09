const NUM: Int = 100;

struct Nested2 {
  c: Int = NUM + 23;
}

struct Nested1 {
  b: Int = 5;
  nb: Nested2 = Nested2{};
}

contract DeepConsts {
  st: Nested1 = Nested1{};
  init() {}
}
