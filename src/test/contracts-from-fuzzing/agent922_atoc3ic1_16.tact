struct Sub1 {a: Int; b: Int?}
struct Sub2 {x: Bool; y: Sub1}

contract TestContract {
   v1: Sub2;

   init() {
      self.v1 = Sub2{ x:true, y:Sub1{a:5,b:null} };
   }
}