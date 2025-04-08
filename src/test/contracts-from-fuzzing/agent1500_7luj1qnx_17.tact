struct OptMix {
  a: Int?;
  b: String?;
  c: Bool?;
  d: Address?;
}

contract MixOptFields {
   val: OptMix;

   init() {
       self.val = OptMix{ a:null, b:null, c:null, d:null };
   }
}