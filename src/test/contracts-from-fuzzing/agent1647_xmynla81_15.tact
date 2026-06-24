struct Mixed {
  s: String?;
  addr: Address?;
  x: Int as int3;
  y: Int as uint5;
}

contract Test(m: Mixed) {}
