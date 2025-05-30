struct Str1 {
  f1: String;
  f2: String;
}

struct Str2 {
  s1: Str1;
  f3: String;
}

contract NestedStrings {
  val: Str2;

  init() {
    self.val = Str2{
      s1: Str1{ f1: "a", f2: "b" },
      f3: "c"
    };
  }
}
