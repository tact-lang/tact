struct Diverse {
  i: Int;
  bo: Bool;
  s: String;
}

contract MultiDiverse {
  v1: Diverse;
  v2: Int;
  v3: String;
  v4: Bool;

  init() {
    self.v1 = Diverse{
      i: 12,
      bo: true,
      s: "hi"
    };
    self.v2 = 34;
    self.v3 = "world";
    self.v4 = false;
  }
}