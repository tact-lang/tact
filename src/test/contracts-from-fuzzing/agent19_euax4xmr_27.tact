struct L3 {
  val: Int = 5;
}

struct L2 {
  deep: L3? = null;
}

struct L1 {
  mid: L2? = null;
}

contract Test {
  data: L1?;
}