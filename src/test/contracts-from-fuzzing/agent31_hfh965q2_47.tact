struct Cont {
 a: Int;
 b: String;
 c: Bool;
}

struct Wrapper {
 inner: Cont;
 flag: Bool;
}

contract Test {
 x: Wrapper;

 init() {
   self.x = Wrapper{ inner: Cont{a:1,b:"hi",c:true}, flag:false };
 }
}