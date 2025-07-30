struct OptStruct {
  a: Int;
  b: Int?;
  c: Bool;
}

contract OptStorage {
  optField: OptStruct = OptStruct{ a: 3, b: null, c: true };
}