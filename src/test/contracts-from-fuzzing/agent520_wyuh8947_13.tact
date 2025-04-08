// test many optional primitive fields with diverse default assignments
contract DiverseOptionals {
  optInt: Int?;
  optBool: Bool?;
  optString: String?;

  init() {
    self.optInt = null;
    self.optBool = true ? null : null;
    self.optString = null;
  }
}