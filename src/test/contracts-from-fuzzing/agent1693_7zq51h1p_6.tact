struct Mixed {
  intField: Int;
  boolField: Bool;
  stringField: String;
}

contract MultiVarTest {
  age: Int = 0;
  active: Bool = false;
  name: String = "";
  info: Mixed;

  init() {
    self.age = 44;
    self.active = true;
    self.name = "John";
    self.info = Mixed{
      intField: 1,
      boolField: false,
      stringField: "X"
    };
  }
}