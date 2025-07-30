struct DefaultInner {
  x: Int = 5;
}

contract InitOuterWithDefaultInner {
  prop: DefaultInner = DefaultInner{};
}