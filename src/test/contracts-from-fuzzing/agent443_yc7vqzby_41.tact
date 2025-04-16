struct TupleLike {
  a: Int;
  b: Bool;
  c: String;
}

contract TupleLikeStore {
  field: TupleLike;

  init() {
    self.field = TupleLike{
      a:42,
      b:true,
      c:"test"
    };
  }
}