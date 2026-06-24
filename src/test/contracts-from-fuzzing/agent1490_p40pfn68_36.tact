struct S {
   a: Int;
   b: Bool?;
   c: String;
   d: Address;
}

contract EmbedStructOpt {
   s: S;

   init() {
      self.s = S{
         a: 99,
         b: null,
         c: "hi",
         d: myAddress()
      };
   }
}