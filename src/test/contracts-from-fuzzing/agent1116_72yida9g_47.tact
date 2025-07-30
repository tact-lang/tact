// optional with string default value
struct DefString {
  name: String = "Satoshi";
  age: Int?;
}

contract OptWithDef {
  s: DefString;

  init() {
    self.s = DefString{ age:null };
  }
}
