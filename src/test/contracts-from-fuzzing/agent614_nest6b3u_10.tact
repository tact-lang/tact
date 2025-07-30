struct Deep1 {
  a: Int;
  b: String?;
}
struct Deep2 {
  x: Deep1;
  y: Bool;
  s: String;
}
struct Deep3 {
  m: Deep2;
  flag: Bool;
  txt: String?;
}

contract TestContract {
  nested: Deep3;

  init() {
    self.nested = Deep3{
      m: Deep2{
        x: Deep1{
          a: 42,
          b: null
        },
        y: true,
        s: "mid"
      },
      flag: false,
      txt: "end"
    };
  }
}