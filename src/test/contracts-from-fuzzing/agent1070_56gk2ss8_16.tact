struct Rec1 {
  val: Rec2;
}

struct Rec2 {
  val: Rec3;
}

struct Rec3 {
  val: Int;
}

contract C {
  r: Rec1;

  init() {
    self.r = Rec1{
      val: Rec2{
        val: Rec3{
          val: 100
        }
      }
    };
  }
}