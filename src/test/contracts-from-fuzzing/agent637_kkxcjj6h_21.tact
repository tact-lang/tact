struct OnlyOptionals {
  o1: Int?;
  o2: Int?;
  o3: String?;
  o4: Cell?;
  o5: Address?;
  o6: Bool?;
}

contract Test {
  optionStruct: OnlyOptionals;
  init() {
    self.optionStruct = OnlyOptionals{};
  }
  receive() {}
}