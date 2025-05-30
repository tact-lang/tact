struct Rec1 {
 a: Int;
 b: Rec2?;
}

struct Rec2 {
 a: Int;
 b: Rec3?;
}

struct Rec3 {
 a: Int;
}

contract RecursiveOptionals {
 data: Rec1;

 init() {
  self.data = Rec1{
   a: 1,
   b: Rec2{
    a: 2,
    b: Rec3{ a: 3 }
   }
  };
 }
}