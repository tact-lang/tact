struct StructLeaf { n: Int; }
struct StructInner { l: StructLeaf; }
struct StructOuter { i: StructInner; }
contract NestedFinal {
  f: StructOuter?;

  init() {
    self.f = null;
  }
}