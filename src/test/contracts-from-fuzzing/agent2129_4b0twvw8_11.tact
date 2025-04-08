struct L {
  l1: Int;
  l2: String;
  l3: Bool;
  l4: Int?;
  l5: String?;
  l6: Bool?;
  l7: Address?;
}

contract ManyOptStructs {
  s1: L;
  s2: L;

  init() {
    self.s1 = L{ l1:1, l2:"a", l3:false, l4:null, l5:null, l6:null, l7:null };
    self.s2 = L{ l1:2, l2:"b", l3:true, l4:null, l5:null, l6:null, l7:null };
  }
}