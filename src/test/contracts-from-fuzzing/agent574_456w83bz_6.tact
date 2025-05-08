struct NestedOpt {
   flag: Bool?;
}

struct Complex {
   nested: NestedOpt?;
}

contract NestedOptionalStructs {
   data: Complex;

   init() {
      self.data = Complex{
         nested: null
      };
   }
}