struct N1 {
  s: String;
}

struct N2 {
  inner: N1;
}

struct N3 {
  inner: N2;
}

struct N4 {
  inner: N3;
}

contract DeepStrings {
  data: N4;
  
  init() {
    self.data = N4{
      inner: N3{
        inner: N2{
          inner: N1{
            s: "Deep"
          }
        }
      }
    };
  }
}
