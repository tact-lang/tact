struct ZeroInt { val: Int = 0; }
struct ZeroBool { val: Bool = false; }

contract ComposedDefaults {
  a: ZeroInt;
  b: ZeroBool;

  init() {
    self.a = ZeroInt{};
    self.b = ZeroBool{};
  }
}