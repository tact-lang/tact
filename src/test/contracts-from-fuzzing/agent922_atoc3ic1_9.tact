struct One { a:Int } 
struct Two { b:One } 
struct Three { c:Two } 
struct Four { d:Three } 
struct Five { e:Four } 

contract TestContract {
 x:Five; 

 init() {
  self.x = Five{ e:Four{ d:Three{ c:Two{ b:One{ a:42 } } } } };
 }  
}