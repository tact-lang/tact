struct Nest1 {
 x: Int;
 y: Int?;
}

struct Nest2 {
 z: Nest1;
 s: String;
}

contract Test {
 data: Nest2;
 init() {
  self.data = Nest2{z:Nest1{x:42,y:null},s:"hello"};
 }
}