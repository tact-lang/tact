struct S {
   a: Int;
   b: Bool;
}

contract NestedOption {
   s: S?;

   init() {
      self.s = null;
   }
}