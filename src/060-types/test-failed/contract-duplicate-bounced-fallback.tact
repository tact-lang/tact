primitive Int;
primitive Bool;
primitive Slice;

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
  
  bounced(src: Slice) {
  }
  
  bounced(msg: Slice) {
  }
}