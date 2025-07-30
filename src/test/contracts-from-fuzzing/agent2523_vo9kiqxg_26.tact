// combine primitive fields and nested struct
struct Inner {
  a: Int;
  b: Bool;
}
contract Blend {
  x: Int;
  y: String;
  member: Inner;
  init() {
    self.x=1;
    self.y="str";
    self.member=Inner{a:3,b:true};
  }
}
