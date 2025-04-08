// mutually nested structs with multiple levels
struct SLevel3 {
  val: Int;
}

struct SLevel2 {
  s3: SLevel3;
  maybeInt: Int?;
}

struct SLevel1 {
  s2: SLevel2;
  flag: Bool;
  optStr: String?;
}

contract MultiNested {
  s1: SLevel1;

  init() {
    self.s1 = SLevel1{
      s2: SLevel2{
        s3: SLevel3{ val: 100 },
        maybeInt: null
      },
      flag: false,
      optStr: null
    };
  }
}