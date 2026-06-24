struct HasBool {
  b1: Bool;
  b2: Bool;
  b3: Bool;
}
contract Bools {
  data: HasBool;
  init() {
    self.data = HasBool{b1:true,b2:false,b3:true};
  }
}