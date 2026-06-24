struct DeepDefault {
  a: Int = 1;
  b: Int?;
}

contract HasDeep {
  d: DeepDefault = DeepDefault{a:2, b:null};
}