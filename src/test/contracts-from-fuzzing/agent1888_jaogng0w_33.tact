struct SOpt {
 a: Int?;
 b: Bool?;
}

contract DefaultOpt {
 s: SOpt;

 init() {
   self.s = SOpt{
     a: null,
     b: null
   };
 }
}
