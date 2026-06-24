// deeply nested optional chain
struct L4{v: Int?;}
struct L3{l4: L4?;}
struct L2{l3: L3?;}
struct L1{l2: L2?;}
contract DeepOptNest{
 x: L1?;
 init(){
   self.x = L1{ l2: L2{ l3: L3{ l4: L4{ v:null } } } };
 }
}