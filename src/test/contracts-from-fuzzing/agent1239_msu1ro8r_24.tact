struct NestCase {
  data1: Int;
  data2: Bool?;
}

contract OptNestCase {
  field: NestCase?;

  init() {
    self.field = null;
  }
}