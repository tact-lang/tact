struct DeeplyComplicated {
  lev1: Lev1;
}

struct Lev1 {
  val1: Bool;
  lev2: Lev2;
}

struct Lev2 {
  val2: Int;
  lev3: Lev3;
}

struct Lev3 {
  s: String;
  done: Bool;
}

contract NestedMulti {
  f: DeeplyComplicated;
  init() {
    self.f = DeeplyComplicated{
      lev1: Lev1{
        val1:true,
        lev2:Lev2{
          val2:99,
          lev3:Lev3{s:"xx",done:false}
        }
      }
    };
  }
}