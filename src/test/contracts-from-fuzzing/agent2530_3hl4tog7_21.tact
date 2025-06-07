struct BigOpt {
  o1: Int?; o2: String?; o3: Address?; o4: Bool?;
  o5: Int = 5; o6: String = "ok"; o7: Address; o8: Bool;
}

contract BigOptUse {
  st: BigOpt;
  init() {
    self.st = BigOpt{
      o1: null, o2: null, o3: null, o4: null,
      o7: myAddress(), o8: true
    };
  }
}