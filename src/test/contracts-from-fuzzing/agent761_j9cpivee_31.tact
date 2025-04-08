struct Opt { a:Int?; b:Bool?; c:String? }
contract StructWithAllNullDefaults {
  val: Opt;
  init() {
    self.val = Opt{ a:null, b:null, c:null };
  }
}