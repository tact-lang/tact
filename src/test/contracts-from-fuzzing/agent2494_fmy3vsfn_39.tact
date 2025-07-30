struct CustomSer {
  a: Int as int64;
  b: Int as uint128;
}
contract SerTest {
  s: CustomSer = CustomSer{a:5,b:10};
}