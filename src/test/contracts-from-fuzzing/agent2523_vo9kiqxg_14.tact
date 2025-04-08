// optional struct field nested
struct DeepOpt {
   inner: Inner?;
}

struct Inner {
   data: Data?;
}

struct Data {
   val: Int?;
   flag: Bool?;
}

contract NestedOptStruct {
   st: DeepOpt;
   init() {
      self.st = DeepOpt{
         inner: Inner{
            data: Data{
               val: null,
               flag: null,
            }
         }
      };
   }
}
