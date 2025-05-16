struct S0 {
 s: Int;
}

struct S1 {
 s: S0;
}

struct S2 {
 s: S1;
}

struct S3 {
 s: S2;
}

struct S4 {
 s: S3;
}

contract LongChain {
 data: S4;

 init() {
  self.data = S4{
    s: S3{
      s: S2{
        s: S1{
          s: S0{ s: 123 }
        }
      }
    }
  };
 }
}