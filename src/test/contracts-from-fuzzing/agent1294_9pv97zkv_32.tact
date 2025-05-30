struct SizedMax {
  val: Int as uint256 = 0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF;
}

contract SizedMaxContract {
  data: SizedMax = SizedMax{};
  receive() {}
}