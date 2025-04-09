struct Super {
  s1: Int;
  s2: Bool;
  s3: String;
}

contract NestedSameStructs {
  f1: Super;
  f2: Super;

  init() {
    self.f1 = Super{s1:1,s2:true,s3:"a"};
    self.f2 = Super{s1:2,s2:false,s3:"b"};
  }
}