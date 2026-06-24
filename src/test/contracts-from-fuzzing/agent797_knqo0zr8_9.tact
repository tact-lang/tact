struct Seq1 {
  a: Int as uint8;
}
struct Seq2 {
  b: Bool;
}
struct Seq3 {
  c: Int as uint16;
}
struct Seq4 {
  d: Bool?;
}

contract DiffSerializations {
   s1: Seq1;
   s2: Seq2;
   s3: Seq3;
   s4: Seq4;

   init() {
     self.s1 = Seq1{a:255};
     self.s2 = Seq2{b:true};
     self.s3 = Seq3{c:65535};
     self.s4 = Seq4{d:false};
   }
}