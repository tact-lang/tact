message WithStruct { s: OtherStruct }

struct OtherStruct { x: Int }

contract Test {
  receive(m: WithStruct) {
    // no-op
  }
}