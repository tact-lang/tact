contract OptionalUint4 {
  small: Int? as uint4;
  
  init() {
    self.small = null;
  }
}