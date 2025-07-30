struct Mess {
  s1: Int?;
  s2: Bool;
  s3: String?;
}

contract OptionalPrimitiveMix {
  st: Mess;

  init() {
    self.st = Mess{ s1:null, s2:true, s3:null };
  }
}