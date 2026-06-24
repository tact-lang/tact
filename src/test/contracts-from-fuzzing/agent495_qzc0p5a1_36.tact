struct Tiny {
  b: Bool;
}
contract C {
   d: Tiny;
   init() {
      self.d = Tiny{ b: true };
   }
}