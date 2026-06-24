struct Params { val: Int }

message Wrapped { params: Params }

contract Test {
  receive(m: Wrapped) {
    let p = m.params;
  }
}