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
  init() {}
  receive(src: A) {
    
  }
  
  bounced(src: bounced<A>) {
    let x: Int = src.c; // Resolve descriptors won't fail on this
  }
  
  bounced(msg: bounced<A>) {
  }
}