// optional struct field with explicit default null
struct S {
  a: Int;
}
contract OptionalStructExplicit {
  s: S? = null;

  init() {
    self.s = null;
  }
}