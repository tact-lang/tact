struct Sub {
  f1: Int;
  f2: Bool;
}

struct NestedManyFields {
  s1: Sub;
  s2: Sub;
  s3: Sub;
  s4: Sub;
}

contract MultiNestedFields {
  all: NestedManyFields;

  init() {
    self.all = NestedManyFields{
      s1: Sub{f1:1,f2:true},
      s2: Sub{f1:2,f2:false},
      s3: Sub{f1:3,f2:true},
      s4: Sub{f1:4,f2:false}
    };
  }
}