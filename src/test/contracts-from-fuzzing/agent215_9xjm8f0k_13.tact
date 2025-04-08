struct Chain4 {
 x: Int;
 y: Bool;
}

struct Chain3 {
 next: Chain4;
 val: Int;
}

struct Chain2 {
 next: Chain3;
 flag: Bool;
}

struct Chain1 {
 next: Chain2;
 s: String;
}

contract ChainContract {
 chain: Chain1 = Chain1{
   next: Chain2{
     next: Chain3{
       next: Chain4{x:5,y:false},
       val:99},
     flag:true},
   s:"ok"
 };
}