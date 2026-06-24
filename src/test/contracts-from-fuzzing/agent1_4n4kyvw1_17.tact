message Recv1 {}
message Recv2 {}

contract Test {
    receive(msg: Recv1) {
    }
    receive(msg: Recv2) {
    }
}