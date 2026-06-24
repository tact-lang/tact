struct NestOptStruct {
  outer: Int?;
  nest1: Int?;
  nest2: Int?;
  nest3: Int?;
}

contract TestOptStruct {
  data: NestOptStruct;

  init() {
    self.data = NestOptStruct {
      outer: null,
      nest1: null,
      nest2: null,
      nest3: null
    };
  }

  receive() {
    if (self.data.outer != null) {
      let _ = self.data.outer!!;
    }
  }
}