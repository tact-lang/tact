struct OptOptStruct {
  optA: Int?;
  optB: Bool?;
}

contract TopOpt {
  f: OptOptStruct?;
  init() {
    self.f = null;
  }
}