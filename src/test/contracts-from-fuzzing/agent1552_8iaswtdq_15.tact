struct Rec1 {
  a: Int;
  b: Bool;
  c: String;
}

struct Rec2 {
  x: Rec1;
  y: Rec1;
}

struct Rec3 {
  m: Rec2;
  n: Int;
}

contract MultiRec {
  data: Rec3;

  init() {
    self.data = Rec3{
      m: Rec2{
        x: Rec1{a:1,b:true,c:"x"},
        y: Rec1{a:2,b:false,c:"y"}
      },
      n: 100
    };
  }
}