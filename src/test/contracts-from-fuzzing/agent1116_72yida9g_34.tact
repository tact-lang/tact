// persistent optional of a struct AND init with null explicit
struct X {
  v: Int;
}

contract OptNull {
   foo: X?;

   init() {
     self.foo = null;
   }
}
