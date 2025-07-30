struct ParInner {
  x: Int;
  y: Int = 5;
}

contract TestContract(
  data: ParInner
) {
  get fun x(): Int {
    return self.data.x;
  }
}