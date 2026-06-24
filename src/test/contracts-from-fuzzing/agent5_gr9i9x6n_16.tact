struct HasFlag {
  ok: Bool;
}

contract OptionalTopLevel {
  data: HasFlag?;

  init() {
    self.data = null;
  }

  receive() {
    if (self.data != null) {
      let _ = self.data!!.ok;
    }
  }
}
