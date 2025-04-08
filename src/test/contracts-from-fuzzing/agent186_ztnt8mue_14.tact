// Optional struct stored in persistent state
struct MaybeData {
  id: Int;
  txt: String;
}

contract TestContract {
  opt: MaybeData?;
  init() {
    self.opt = null;
  }
}