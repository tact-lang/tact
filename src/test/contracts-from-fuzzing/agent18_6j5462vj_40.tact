struct HasBool {
  a: Bool;
  b: Bool?;
}

contract BoolTests {
  val: HasBool;

  init() {
    self.val = HasBool{ a:true, b:null };
  }
}