message Alpha { x: Int }
message Beta { x: Int }

contract Test {
    receive(msg: Alpha) {}
    receive(msg: Beta) {}
}