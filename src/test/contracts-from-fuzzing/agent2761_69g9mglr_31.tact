struct RecA { x: Bool; y: Int; z: String; q: Int?; }
contract CompoundNested {
 fa: RecA;
 fb: RecA;
 fc: RecA;
 
 init() {
  self.fa = RecA{x:true,y:1,z:"hi",q:null};
  self.fb = RecA{x:false,y:2,z:"ho",q:null};
  self.fc = RecA{x:true,y:3,z:"ha",q:null};
 }
}
