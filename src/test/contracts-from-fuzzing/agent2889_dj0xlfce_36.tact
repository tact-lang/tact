struct Sub {
  i: Int;
}

struct BigWrap {
  s0: Sub;
  s1: Sub;
  s2: Sub;
  s3: Sub;
  s4: Sub;
  s5: Sub;
  s6: Sub;
  s7: Sub;
  s8: Sub;
  s9: Sub;
}

contract NestedMultiStruct {
  val: BigWrap;

  init() {
    self.val = BigWrap{
      s0: Sub{ i: 0 },
      s1: Sub{ i: 1 },
      s2: Sub{ i: 2 },
      s3: Sub{ i: 3 },
      s4: Sub{ i: 4 },
      s5: Sub{ i: 5 },
      s6: Sub{ i: 6 },
      s7: Sub{ i: 7 },
      s8: Sub{ i: 8 },
      s9: Sub{ i: 9 }
    };
  }
}