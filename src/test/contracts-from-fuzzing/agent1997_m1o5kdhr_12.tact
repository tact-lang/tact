struct Info {
  code: Cell;
  active: Bool;
}

contract ParamsMix(
  name: String?,
  meta: Info,
) {
  receive() {
    let _ = self.meta.code;
  }
}
