struct ManyOptionals {
  o1: Int?;
  o2: Bool?;
  o3: String?;
  o4: Int?;
  o5: Bool?;
  o6: String?;
}

contract Test {
  x: ManyOptionals;

  init() {
    self.x = ManyOptionals{
      o1: null,
      o2: true,
      o3: null,
      o4: 42,
      o5: null,
      o6: "hey",
    };
  }
}