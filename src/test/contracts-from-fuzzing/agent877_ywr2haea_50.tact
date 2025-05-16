// Optional inside optional, nested contract persistent fields
struct Mid {
  a: Int?;
}

contract OptionalInsideOptional {
  m: Mid?;

  init() {
    self.m = null;
  }
}