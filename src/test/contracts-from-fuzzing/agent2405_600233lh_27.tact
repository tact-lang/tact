message M1 { val: Int; }
message M2 { val: Bool; }

struct Container {
   m1: M1;
   m2: M2;
}

contract NestedMsgs {
   data: Container;

   init() {
      self.data = Container{
         m1: M1{ val: 5 },
         m2: M2{ val: true }
      };
   }
}