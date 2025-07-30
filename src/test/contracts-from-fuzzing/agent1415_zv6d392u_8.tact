struct ManyOptionals {
  o1: Int?;
  o2: String?;
  o3: Bool?;
  o4: Address?;
  o5: Int?;
  o6: String?;
  o7: Bool?;
  o8: Address?;
}

contract TestContract {
  many: ManyOptionals;

  init() {
    self.many = ManyOptionals{
      o1: null,
      o2: null,
      o3: null,
      o4: null,
      o5: null,
      o6: null,
      o7: null,
      o8: null,
    };
  }
}