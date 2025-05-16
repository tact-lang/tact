struct Tiny{
  a:Int;
}

contract TinyStructContract{
  f:Tiny;
  init() {
    self.f = Tiny{a:1};
  }
}