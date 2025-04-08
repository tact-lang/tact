// deeply nested defaulted optional + assignment in init
struct L3 { v:Int?=null; }
struct L2 { l3:L3?=null; }
struct L1 { l2:L2?=null; }
contract AssignDeepNested {
 x:L1?=null;
 init() {
   self.x = L1{ l2:L2{ l3:L3{ v:123 } } };
 }
}