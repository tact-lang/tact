// test struct with many optionals inside a contract
struct ManyOptionals {
  f1: Int?; f2: Bool?; f3: String?;
  f4: Int?; f5: Bool?; f6: String?;
  f7: Int?; f8: Bool?; f9: String?;
}
contract Test {
  data: ManyOptionals;
  init() {
    self.data = ManyOptionals{
      f1:null, f2:null, f3:null,
      f4:null, f5:null, f6:null,
      f7:null, f8:null, f9:null
    };
  }
}