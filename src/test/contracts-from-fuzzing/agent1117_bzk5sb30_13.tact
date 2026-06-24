struct Str1 {
  s: String;
}

struct Str2 {
  a: Str1;
}

contract StrDeeper {
  val: Str2;

  init() {
    self.val = Str2{ a: Str1{ s: "hello" } };
  }
}
