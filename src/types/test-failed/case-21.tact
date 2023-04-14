primitive Int;

trait BaseTrait {

}

message A {
  a: Int as uint32;
}

contract Test {
  init() {}
  receive(src: A) {
    
  }
  
  bounced(src: Int) {
    
  }
}