struct SubData {
  z: Int;
}

contract OptionalParam(
  fancy: SubData?,
) {
  receive() {
    if (self.fancy != null) {
      let _ = self.fancy!!;
    }
  }
}
