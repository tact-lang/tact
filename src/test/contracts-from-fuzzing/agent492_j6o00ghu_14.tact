struct RecPayload {
  s: String;
  inner: InnerRec;
}

struct InnerRec {
  flag: Bool;
  txt: String;
}

contract RecStructWithOption {
  field: RecPayload?;

  init() {
    self.field = null;
  }
}
