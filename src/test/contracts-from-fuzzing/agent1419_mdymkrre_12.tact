struct Str1 { a: String }
struct Str2 { b: String? }
struct Str3 { c: String }

contract StringsTest {
  s1: Str1;
  s2: Str2;
  s3: Str3;

  init() {
    self.s1 = Str1{ a: "hello" };
    self.s2 = Str2{ b: null };
    self.s3 = Str3{ c: "world" };
  }
}