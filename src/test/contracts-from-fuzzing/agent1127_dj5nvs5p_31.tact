struct ManyOptionals {
  o1: Int?;
  o2: Bool?;
  o3: String?;
  o4: Address?;
  o5: Cell?;
}

contract OptionalFields {
  data: ManyOptionals;

  init() {
    self.data = ManyOptionals{
      o1: null,
      o2: true,
      o3: null,
      o4: null,
      o5: null,
    };
  }
}
