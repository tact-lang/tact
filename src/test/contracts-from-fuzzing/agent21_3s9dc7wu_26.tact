message HasSlice { data: Slice }

contract Test {
  receive(m: HasSlice) {}
}