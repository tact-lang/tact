struct DeeplyOptional {
 a: Int?;
 b: Inner?;
}

struct Inner {
 x: Int?;
 y: String?;
}

contract OptionalNest {
 f: DeeplyOptional;

 init() {
   self.f = DeeplyOptional{
     a: null,
     b: Inner{
       x: null,
       y: null,
     },
   };
 }
}
