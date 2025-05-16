struct N1 {
  val: Int;
}

struct N2 {
  n: N1;
}

struct N3 {
  n: N2;
}

struct N4 {
  n: N3;
}

contract TestContract {
  deep: N4;

  init() {
    self.deep = N4{
      n: N3{
        n: N2{
          n: N1{
            val: 999
          }
        }
      }
    };
  }
}