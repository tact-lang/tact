message InnerMsg { a: Int }
message OuterMsg { b: InnerMsg }

contract Test {
  receive() {}
}