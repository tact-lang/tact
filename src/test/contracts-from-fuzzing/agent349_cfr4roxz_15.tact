// Edge: optional entire struct stored
struct Info {
  n: Int;
  s: String;
}

contract OptionalStruct {
  info: Info?;

  init() {
    self.info = Info{ n: 5, s: "hi" };
  }
}