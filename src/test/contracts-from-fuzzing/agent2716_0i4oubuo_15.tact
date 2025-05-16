struct MultiNested1 {
  a: Int;
  b: Bool;
}
struct MultiNested2 {
  mn1: MultiNested1;
  s: String;
}
struct MultiNested3 {
  mn2: MultiNested2;
  i: Int?;
}

contract MultiNest {
  data: MultiNested3;

  init() {
    self.data = MultiNested3{
      mn2: MultiNested2{
        mn1: MultiNested1{a:1,b:false},
        s: "str"
      },
      i:null
    };
  }
}