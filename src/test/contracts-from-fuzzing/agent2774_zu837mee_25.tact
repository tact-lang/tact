// struct with multiple serialization tags
struct SerializeMix {
  a: Int as int64;
  b: Int as uint16;
  c: Int;  // default int257
  d: Bool;
  e: String;
}

contract TestContract {
  val: SerializeMix;

  init() {
    self.val = SerializeMix{
      a: 123,
      b: 456,
      c: 789,
      d: true,
      e: "hi"
    };
  }
}