struct SuperNested {
   level: Int;
   next: SubNested;
}

struct SubNested {
   flag: Bool;
   again: SubSubNested;
}

struct SubSubNested {
   id: Int;
   note: String;
}

contract TestMultiNest {
   s: SuperNested;

   init() {
      self.s = SuperNested{
         level: 1,
         next: SubNested{
            flag: true,
            again: SubSubNested{
               id: 42,
               note: "deep"
            }
         }
      };
   }
}