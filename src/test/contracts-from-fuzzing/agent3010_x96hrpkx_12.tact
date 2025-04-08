struct S1 { val: Int; }
struct S2 { val: Bool; }
struct S3 { val: String; }

struct TopCombo {
  s1: S1;
  s2: S2;
  s3: S3;
}

contract ComboFields {
  field: TopCombo;

  init() {
    self.field = TopCombo{
      s1: S1{ val: 123 },
      s2: S2{ val: true },
      s3: S3{ val: "hi" }
    };
  }
}