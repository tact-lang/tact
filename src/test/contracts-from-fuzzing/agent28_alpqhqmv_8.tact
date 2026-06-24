message CrossStructMessage {
  s: InnerStruct
}

struct InnerStruct {
  value: Int
}

contract Test {
  receive() {
    let m: CrossStructMessage = CrossStructMessage{s: InnerStruct{value: 8}};
  }
}