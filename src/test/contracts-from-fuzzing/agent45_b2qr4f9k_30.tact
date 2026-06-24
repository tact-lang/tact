struct SInner { val:Int }
struct SMiddle { inner:SInner }
struct SOuter { middle:SMiddle }

contract ComplexNested {
  o:SOuter;
  init() {
    self.o = SOuter{ middle: SMiddle{ inner: SInner{ val:2023 } } };
  }
}