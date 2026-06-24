// deeply nested struct tree, used only in persistent state var
struct S4 { flag: Bool; }
struct S3 { s4: S4; }
struct S2 { s3: S3; }
struct S1 { s2: S2; }

contract VeryDeepNestedStructs {
  data: S1;

  init() {
    self.data = S1{
      s2: S2{
        s3: S3{
          s4: S4{ flag: true }
        }
      }
    };
  }
}