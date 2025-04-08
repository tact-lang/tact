struct ManyOptionals {
  o1: Int? = null;
  o2: Int? = 2;
  o3: Bool? = null;
  o4: Bool? = true;
  o5: String? = null;
  o6: String? = "test";
  o7: Int? = null;
  o8: Int? = 8;
  o9: Bool? = null;
  o10: Bool? = false;
}

contract OptionalDefaults {
  val: ManyOptionals = ManyOptionals{};

  receive() {
    self.val = self.val;
  }
}