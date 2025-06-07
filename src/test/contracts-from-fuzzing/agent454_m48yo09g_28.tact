struct Inner {
 x: Int;
 y: Bool;
 z: String;
}

struct OuterOpt {
 inn: Inner?;
}

contract OptDeepStruct {
   data: OuterOpt;
   init() {
     self.data = OuterOpt{inn: null};
   }
}