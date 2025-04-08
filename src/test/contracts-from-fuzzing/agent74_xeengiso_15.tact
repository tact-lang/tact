struct BigOptional {
  o1: Int?;
  o2: String?;
  o3: Bool?;
  o4: Int?;
  o5: String?;
  o6: Bool?;
}

contract TestContract {
  data: BigOptional;
  init() {
    self.data = BigOptional{
      o1: null,
      o2: null,
      o3: null,
      o4: null,
      o5: null,
      o6: null,
    };
  }
}