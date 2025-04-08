struct OptDefault {
  a: Int?;
  b: Int? = null;
  c: Int? = 0;
}

contract OptDefaults {
  f: OptDefault = OptDefault{a:null,b:null,c:42};
}