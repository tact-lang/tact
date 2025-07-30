struct RecOpt1 {
 a: Int; b: RecOpt2?;
}

struct RecOpt2 {
 a: Int; b: RecOpt3?;
}

struct RecOpt3 {
 a: Int;
}

contract RecOptWrap {
 data: RecOpt1;

 init() {
  self.data = RecOpt1{
    a: 1,
    b: RecOpt2{
      a: 2,
      b: RecOpt3{ a: 3 }
    }
  };
 }
}