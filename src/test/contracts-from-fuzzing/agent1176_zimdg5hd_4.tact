struct Detail {
  val: Int = 2;
  msg: String = "ok";
}

contract MultiNestedFields {
  field1: Detail;
  field2: Detail?;
  n: Int = 0;
  flag: Bool = false;
  txt: String = "hello";

  init() {
    self.field1 = Detail{};
    self.field2 = null;
  }
}