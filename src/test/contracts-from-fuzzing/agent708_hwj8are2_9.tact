struct S1 {
  i: Int;
}

struct S2 {
  s1: S1; 
  b: Bool;
}

struct S3 {
  s2: S2;
  text: String;
}

contract NestedOptional {
  data: S3?;
  init() {
    self.data = null;
  }
}