struct Sub {
  x: Int;
}

struct NestStruct {
  s1: Sub;
  s2: Sub;
  s3: Sub;
  optionalSub: Sub?;
  optInt: Int?;
  optBool: Bool?;
}

contract TestContract {
  data: NestStruct;

  init() {
    self.data = NestStruct{
      s1: Sub{ x: 1 },
      s2: Sub{ x: 2 },
      s3: Sub{ x: 3 },
      optionalSub: null,
      optInt: null,
      optBool: true
    };
  }
}