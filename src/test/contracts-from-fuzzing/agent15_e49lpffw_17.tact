struct ManyOptionalNest {
 a: Int?;
 b: Bool?;
 c: Int?;
 d: Bool?;
 e: Int?;
 f: Bool?;
}

contract ComplexOptionals {
 data: ManyOptionalNest;

 init() {
   self.data = ManyOptionalNest{
     a: null,
     b: null,
     c: null,
     d: null,
     e: null,
     f: null
   };
 }
}