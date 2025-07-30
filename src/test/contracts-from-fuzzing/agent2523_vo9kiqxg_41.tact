// nested persistent with deep serialization modifiers
struct Leaf {
 a:Int as uint32;
 b:Int as coins;
 c:Bool;
}
struct Branch {
 l:Leaf;
 r:Leaf;
}
contract DeepSerial {
 data: Branch;
 init() {
   self.data=Branch{
     l:Leaf{a:1,b:ton("0.1"),c:true},
     r:Leaf{a:2,b:ton("0.2"),c:false}
   };
 }
}
