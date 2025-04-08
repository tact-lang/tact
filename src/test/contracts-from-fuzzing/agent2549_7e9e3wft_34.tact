struct ListInt {
  a: Int; b: Int; c: Int; d: Int; e: Int;
}

contract IntStore {
  field: ListInt;

  init() {
    self.field = ListInt{a:1,b:2,c:3,d:4,e:5};
  }
}