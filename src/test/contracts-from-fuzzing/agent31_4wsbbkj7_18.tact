message Empty {}
message AlsoEmpty {}

contract Test {
    receive(msg: Empty) {}
    receive(msg: AlsoEmpty) {}
}