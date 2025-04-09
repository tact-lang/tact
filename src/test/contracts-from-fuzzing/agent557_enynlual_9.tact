struct SOpt {
 x: Int?;
 y: Bool?;
 str: String?;
}

contract TestContract {
 data: SOpt;
 init() {
   self.data = SOpt{
     x:null,
     y:null,
     str:null
   };
 }
}