struct DefOpt {
 x: Int? = null;
 y: Bool? = null;
}

contract NestedDefaultOpts {
   f: DefOpt = DefOpt{};

   init() {
     self.f = DefOpt{x:42,y:true};
   }
}