// Contract with optional struct held as contract field
struct OptHolder { val: Int; }

contract OptStructField {
  opt: OptHolder?;

  init() {
    self.opt = OptHolder{val: 999};
  }
}