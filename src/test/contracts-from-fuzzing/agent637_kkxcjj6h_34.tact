struct Multi {
  a: Int?;
  b: Bool?;
  s1: String?;
}

struct Wrapper {
  w1: Multi?;
  w2: Multi?;
}

contract Test {
  get fun getWrap(): Wrapper {
    return Wrapper{};
  }
}