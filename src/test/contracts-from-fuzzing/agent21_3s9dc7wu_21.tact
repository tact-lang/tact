message Msg1 { x: Int }
message Msg2 { y: Msg1 }
message Msg3 { z: Msg2 }

contract Test {
  receive(m: Msg3) {}
}