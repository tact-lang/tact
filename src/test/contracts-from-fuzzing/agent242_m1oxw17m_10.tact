struct MultipleOptionals {
  o1: Int?;
  o2: Bool?;
  o3: String?;
  o4: Address?;
}

contract MultiOpt {
  m: MultipleOptionals;

  init() {
    self.m = MultipleOptionals{
      o1: 7,
      o2: null,
      o3: "hi",
      o4: null,
    };
  }
}