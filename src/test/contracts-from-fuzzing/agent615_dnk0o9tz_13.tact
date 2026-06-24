struct Deep {
  s1: S1;
}

struct S1 {
  s2: S2;
}

struct S2 {
  s3: S3;
}

struct S3 {
  s4: S4;
}

struct S4 {
  s5: S5;
}

struct S5 {
  val: Int;
}

contract TestContract {
  d: Deep;

  init() {
    self.d = Deep{
      s1: S1{
        s2: S2{
          s3: S3{
            s4: S4{
              s5: S5{
                val: 42
              }
            }
          }
        }
      }
    };
  }
}