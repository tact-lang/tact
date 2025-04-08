struct S3 {
  a: Int = 44;
  b: Bool?;        // implicit null
}

struct S2 {
  c: S3?;
  d: Int = 55;
}

struct S1 {
  x: S2?;
  y: Bool? = null;
}

contract TestContract {
  val: S1;

  init() {
    self.val = S1{
      x: S2{
        c: null,
        d: 66
      },
      y: null
    };
  }
}