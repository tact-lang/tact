struct SOptOpt {
  x: Int?;
  y: String?;
}

contract NestedOptionalFields {
  sa: SOptOpt?;

  init() {
    self.sa = SOptOpt{ x:null, y:"abc" };
  }
}