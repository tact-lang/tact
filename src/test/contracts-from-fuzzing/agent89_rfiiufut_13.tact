struct LargeInner {
  f1:Int; f2:Int; f3:Int; f4:Int; f5:Int;
  f6:Int; f7:Int; f8:Int; f9:Int; f10:Int;
}

struct OuterLarge {
  inner: LargeInner;
}

contract NestedLargeStruct {
  s: OuterLarge;

  init() {
    self.s = OuterLarge {
      inner: LargeInner {
        f1:1,f2:1,f3:1,f4:1,f5:1,f6:1,f7:1,f8:1,f9:1,f10:1
      }
    };
  }
}
