message InnerMsg {
  x: Int
}

message OuterMsg {
  embedded: InnerMsg
}

contract Test {
    receive() {
        // Do nothing
    }
}