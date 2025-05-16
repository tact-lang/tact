struct MinInt {
  smallest: Int = -0x8000000000000000000000000000000000000000000000000000000000000000;
}

contract MinIntTest {
  val: MinInt = MinInt{};
  receive() {}
}