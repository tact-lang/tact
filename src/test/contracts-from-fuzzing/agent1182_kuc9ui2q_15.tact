struct LVL3 {
  field: Int;
}
struct LVL2 {
  child: LVL3;
}
struct LVL1 {
  child: LVL2;
}

contract LvlTest {
  val: LVL1;

  init() {
    self.val = LVL1{
      child: LVL2{
        child: LVL3{ field: 123 }
      }
    };
  }
}
