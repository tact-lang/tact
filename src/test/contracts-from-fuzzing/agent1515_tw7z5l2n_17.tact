struct Container {
  id: Int?
}

contract ParamStructDemo(
  wrap: Container,
) {
  receive() { dump(0); }
}