struct HasBigInt {
  i: Int as uint256;
}
contract BigIntField {
  f: HasBigInt = HasBigInt{i:10};
}