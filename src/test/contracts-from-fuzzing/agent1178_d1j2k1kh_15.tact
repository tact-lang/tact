struct O1 { f: Int?; }
struct O2 { g: String?; }
struct CombineOpt {
  a: O1?;
  b: O2?;
}
contract Test {
  data: CombineOpt;

  init() {
    self.data = CombineOpt{ a:null, b:null };
  }
}