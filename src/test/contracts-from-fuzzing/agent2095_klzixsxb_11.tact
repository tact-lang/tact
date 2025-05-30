struct Optionals {
  o0: Int?;
  o1: Address?;
  o2: Cell?;
  o3: String?;
  o4: Slice?;
  o5: Builder?;
  o6: Bool?;
}

contract OptMany {
  data: Optionals;

  init() {
    self.data = Optionals{
      o0: null,
      o1: null,
      o2: null,
      o3: null,
      o4: null,
      o5: null,
      o6: null
    };
  }
}