struct ManyTypes {
  i: Int;
  b: Bool;
  s: String;
  a: Address;
  c: Cell;
  sl: Slice;
}

struct Outer {
  t: ManyTypes;
}

contract TestContract {
  d: Outer;

  init() {
    self.d = Outer{
      t: ManyTypes{
        i:1, b:true, s:"s", a:myAddress(), c:emptyCell(), sl:emptyCell().asSlice()
      }
    };
  }
}