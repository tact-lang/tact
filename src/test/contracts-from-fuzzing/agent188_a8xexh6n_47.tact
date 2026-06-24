struct X1 {
  a: Int?;
}

contract OmitInitOptionalStruct {
  val: X1?;
  // No init() at all
}