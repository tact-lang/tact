struct Info {
  a: Int;
  s: String?;
}
struct Data {
  x: Info;
  y: Info;
}

contract DoubleStruct {
  dat: Data;

  init() {
    self.dat = Data{
      x: Info{a:1,s:null},
      y: Info{a:2,s:"y"}
    };
  }
}