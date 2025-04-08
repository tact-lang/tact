struct SInner { s: String; }
struct SOuter { inner: SInner?; }

contract NullOptStruct {
  field: SOuter?;

  init() {
    self.field = null;
  }
}