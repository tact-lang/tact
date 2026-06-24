struct MixOptionals {
  intVal: Int?;
  strVal: String?;
  boolVal: Bool?;
  addrVal: Address?;
}

contract VariousOptionals {
  st: MixOptionals;

  init() {
    self.st = MixOptionals{
      intVal: null,
      strVal: null,
      boolVal: null,
      addrVal: null
    };
  }

  receive() {
    if (self.st.strVal != null) {
      let _ = self.st.strVal!!;
    }
  }
}
