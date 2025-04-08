message Msg {} 

struct Wrap {
  op: Msg;
}

contract Test {
  m: Wrap = Wrap{ op: Msg{} };
}
