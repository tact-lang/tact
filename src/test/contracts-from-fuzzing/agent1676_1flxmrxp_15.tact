struct Arr {
  v1: Int;
  v2: Int;
  v3: Int;
  v4: Int;
  v5: Int;
}

struct NestedArr {
  a: Arr;
  b: Arr;
}

contract NestedArrsPersist {
  data: NestedArr;

  init() {
    self.data = NestedArr{
      a: Arr{v1:1,v2:2,v3:3,v4:4,v5:5},
      b: Arr{v1:6,v2:7,v3:8,v4:9,v5:10}
    };
  }
}