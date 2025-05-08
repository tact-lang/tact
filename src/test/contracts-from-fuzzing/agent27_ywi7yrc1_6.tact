struct StrNest {
   message: String;
   inner: Inner;
}

struct Inner {
   flag: Bool;
   num: Int;
}

contract TestStrNestedStruct {
   data: StrNest;

   init() {
      self.data = StrNest{
         message: "hello",
         inner: Inner{ flag: true, num: 7 },
      };
   }
}