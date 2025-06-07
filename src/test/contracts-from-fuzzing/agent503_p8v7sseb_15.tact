struct InnerDef {
  val: Int?; // implicitly null
  txt: String = "hey";
}

contract PartialAndDefaults {
  data: InnerDef = InnerDef{};

  init() {
    self.data = InnerDef{ txt: "custom" };
  }
}
