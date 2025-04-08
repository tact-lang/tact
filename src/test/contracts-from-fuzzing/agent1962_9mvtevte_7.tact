struct Multi1 { a: Int; b: Bool; c: String; }
struct Multi2 { x: Address; y: Cell; z: Slice; }

contract ManyFields {
  f1: Int;
  f2: Bool;
  f3: String;
  f4: Address;
  f5: Cell;
  f6: Slice;
  
  s1: Multi1;
  s2: Multi2;
  opt1: Multi1?;
  opt2: Multi2?;

  init() {
    self.f1 = 1;
    self.f2 = false;
    self.f3 = "a";
    self.f4 = myAddress();
    self.f5 = emptyCell();
    self.f6 = emptyCell().asSlice();

    self.s1 = Multi1{a:1,b:true,c:"x"};
    self.s2 = Multi2{x:myAddress(),y:emptyCell(),z:emptyCell().asSlice()};
    self.opt1 = null;
    self.opt2 = self.s2;
  }
}