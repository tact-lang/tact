struct Test {
 a: Int;
 b: Int;
 c: Int;
}

contract Defaults {
 t: Test;

 init() {
  self.t = Test{ a:1,b:2,c:3 };
 }
}