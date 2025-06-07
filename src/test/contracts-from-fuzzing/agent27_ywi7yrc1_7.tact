struct OptInner {
   value: Int?;
}

struct NestedOpt {
   a: Int;
   b: OptInner;
}

contract ContractNestedOpt {
   data: NestedOpt;

   init() {
      self.data = NestedOpt{
         a: 1,
         b: OptInner{ value: null },
      };
   }
}