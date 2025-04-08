struct S {
  b: Bool;
  i: Int;
  s: String;
  o1: Int?;
  o2: Bool?;
  o3: String?;
}

contract ComboTest {
  data: S;

  init() {
    self.data = S{
      b: true,
      i: 123,
      s: "abc",
      o1: null,
      o2: false,
      o3: "zzz"
    };
  }
}