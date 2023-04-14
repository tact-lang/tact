primitive Int;
primitive Bool;

trait BaseTrait {
    
}

message A {
  a: Int as uint32;
  b: Bool;
  c: Int as uint256;
}

contract Test {
  src: bounced<A>;
  init() {}
  receive(src: A) {
    
  }
  
  // bounced(src: bounced<A>) {
  //   let x: Int = src.a;
  //   let y: Bool = src.b;
  //   let z: Int = src.c;
  // }
}