// contract persistent fields of struct[] array is invalid in Tact, but let's test single embedded message
message(1) MsgA {
  count: Int;
}

struct Container {
  m: MsgA;
  flag: Bool;
}

contract StructContainingMessage {
  c: Container;

  init() {
    self.c = Container{ m: MsgA{ count: 5 }, flag: true };
  }
}