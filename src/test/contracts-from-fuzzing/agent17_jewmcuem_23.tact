message M1 { x: Int }
message M2 { y: Int }

message M3 {}

contract Test {
   receive(msg: M1) {}
   receive(msg: M2) {}
   receive(msg: M3) {}
}