struct SLevel1 {
  a: Int;
  b: Int?;
}

struct SLevel2 {
  inner1: SLevel1;
  inner2: SLevel1?;
}

struct SLevel3 {
  inner: SLevel2;
}

contract MultiOptNested {
  s: SLevel3 = SLevel3{
    inner: SLevel2{
      inner1: SLevel1{a:1,b:null},
      inner2: null
     }
  };
}