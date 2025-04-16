struct S1 {a:Int; b:Bool}
struct S2 {c:String?; d:S1}
struct S3 {e:S2; f:Int?}

contract TestContract {
  x:S3;

  init() {
    self.x = S3 {
      e: S2 { c:null, d:S1{a:11,b:true} },
      f:42
    };
  }
}