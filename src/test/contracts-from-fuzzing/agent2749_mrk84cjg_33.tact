struct SomeStruct {
   a: Int;
   b: String;
   c: Bool?;
}

contract InitDefaults {
   field: SomeStruct;

   init() {
      self.field = SomeStruct{
        a:0,
        b:"",
        c:null
      };
   }
}