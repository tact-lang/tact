primitive Slice;

trait BaseTrait {

}

message A {
  a: Slice as bytes32;
}

contract Test {
  init() {}
  receive(src: A) {

  }

  bounced(src: bounced<A>) {
    let x: Int = src.a;
  }
}
