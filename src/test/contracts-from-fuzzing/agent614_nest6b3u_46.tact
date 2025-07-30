contract OptionalNoAssign {
  optVal: String?;

  init() {
    // left unassigned, should default to null
  }
}