contract BoolDefaults {
  flagTrue: Bool = true;
  flagFalse: Bool = false;

  init() {
    self.flagTrue = false;
    self.flagFalse = true;
  }
}