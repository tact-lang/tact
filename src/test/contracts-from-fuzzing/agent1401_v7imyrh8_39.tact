struct MixMany {
  i: Int;
  b: Bool;
  s: String;
  a: Address;
  c: Cell;
}

contract MixManyFields {
  m: MixMany;

  init() {
    self.m = MixMany{i:1,b:true,s:"x",a:myAddress(),c:emptyCell()};
  }
}