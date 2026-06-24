contract LargeNested {
  field: Wrapper2;

  init() {
    self.field = Wrapper2{
      nested: Wrapper1{
        wrapped: Wrapper0{
          inner: Deep0{
            a:1, b:true, c:"hi"
          }
        }
      }
    };
  }
}

struct Deep0 {
  a: Int;
  b: Bool;
  c: String;
}

struct Wrapper0 {
  inner: Deep0;
}

struct Wrapper1 {
  wrapped: Wrapper0;
}

struct Wrapper2 {
  nested: Wrapper1;
}
