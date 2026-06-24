struct EmptyDefaults {
  a: Int?;
  b: Bool?;
}

contract AssignedNulls {
  persistent: EmptyDefaults;

  init() {
    self.persistent = EmptyDefaults{
      a:null,
      b:null
    };
  }
}