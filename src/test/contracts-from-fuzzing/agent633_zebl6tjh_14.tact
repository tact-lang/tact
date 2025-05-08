struct MidOptional {
   a: Int;
   b: Bool?;
}

struct OuterOptional {
   x: Int?;
   y: MidOptional?;
}

contract OptionalNesting {
   nested: OuterOptional = OuterOptional{
       x: null,
       y: null
   };
}