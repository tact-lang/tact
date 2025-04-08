struct InnerA {
  a: Int;
}

struct InnerB {
  b: Int;
}

struct Container {
  one: InnerA;
  two: InnerB;
}

contract StructWithMultipleNested{
   nestedData: Container;

   init() {
     self.nestedData = Container{
       one: InnerA{ a:1 },
       two: InnerB{ b:2 }
     };
   }
}