struct Opt1 { a: Int?; }
struct Opt2 { b: Bool?; }
struct Opt3 { c: String?; }

contract DeepOptional {
  s1: Opt1?;
  s2: Opt2?;
  s3: Opt3?;
  init() {
    self.s1 = null;
    self.s2 = null;
    self.s3 = null;
  }
}