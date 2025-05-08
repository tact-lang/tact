struct OptSer {
  foo: Int as uint64;
  bar: Int?;
}

contract OptSerStorage {
  stuff: OptSer? = null;
  receive() {}
}