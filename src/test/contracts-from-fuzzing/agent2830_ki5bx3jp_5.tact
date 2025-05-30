struct S1 {
  a: Int;
}

struct S2 {
  b: Bool;
}

struct S3 {
  c: String;
}

struct S4 {
  d: Int?;
}

struct BigCombo {
  s1: S1;
  s2: S2;
  s3: S3;
  s4: S4;
  num: Int;
  txt: String;
  opt: String?;
  flag: Bool;
}

contract MultipleNested {
  all: BigCombo;
  init() {
    self.all = BigCombo{
      s1: S1{a:1},
      s2: S2{b:true},
      s3: S3{c:"x"},
      s4: S4{d:null},
      num: 99,
      txt: "hello",
      opt: null,
      flag: false
    };
  }
}