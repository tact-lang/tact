// Struct inside struct inside struct with mix of opt, Bool, Int
struct S1 { a: Int; b: Bool?; }
struct S2 { k: S1; x: Int?; }
struct S3 { inner: S2; y: Bool; }
contract NestMix {
  data: S3;
  init() {
    self.data = S3{ inner: S2{ k: S1{a:2, b:null}, x:null }, y:true};
  }
}