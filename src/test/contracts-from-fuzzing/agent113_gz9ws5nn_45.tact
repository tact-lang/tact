struct RecWrap1 {
  r2: RecWrap2?;
}

struct RecWrap2 {
  r3: RecWrap3?;
}

struct RecWrap3 {
  value: Int?;
}

contract RecursiveOptionWrap {
  w: RecWrap1;

  init() {
    self.w = RecWrap1{ r2: null };
  }
}