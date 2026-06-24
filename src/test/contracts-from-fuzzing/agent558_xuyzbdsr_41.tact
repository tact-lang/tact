// nested combo optional with some default inner but null outer
struct Base2 {
  xx: Int = 10;
}

struct Wrap2 {
  inner: Base2? = null;
}

contract Test {
  y: Wrap2 = Wrap2{};
}