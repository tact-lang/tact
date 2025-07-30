contract LongStringDefaults {
  a: String = "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa";
  b: String = "bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb";
  c: String = "cccccccccccccccccccccccccccccccccccccccccccccccccc";

  init() {
    self.a = "foo";
    self.b = "bar";
    self.c = "baz";
  }
}