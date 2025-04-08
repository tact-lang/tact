struct Inner { b: Int }

struct Wrapper {
   maybe: Inner?;
   flag: Bool;
}

contract OptionalStructField {
   s: Wrapper = Wrapper{maybe:null, flag:true};

   init() {
      self.s = Wrapper{maybe:null, flag:true};
   }
}