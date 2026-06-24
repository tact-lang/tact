struct Chain1 { next: Chain2?; v:Int; }
struct Chain2 { next: Chain3?; v:Int; }
struct Chain3 { next: Chain4?; v:Int; }
struct Chain4 { next: Chain5?; v:Int; }
struct Chain5 { v:Int; }

contract OptionChain {
 tail: Chain1?;
 init() {
   self.tail=null;
 }
}