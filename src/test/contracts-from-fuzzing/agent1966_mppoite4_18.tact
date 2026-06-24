struct SubOk {
  x: Int;
}

struct ParentSet {
  a: SubOk;
  b: SubOk;
}

contract DuplicatesOfSameStruct {
  data: ParentSet;

  init() {
    self.data = ParentSet{
      a: SubOk{ x: 1 },
      b: SubOk{ x: 2 }
    };
  }
}
