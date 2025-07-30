struct InnerInfo {
  n: Int;
  t: String;
}

struct MiddleInfo {
  a: Bool;
  s: Slice;
  i: InnerInfo;
}

contract NestedMultiType {
  state: MiddleInfo;
  init() {
    self.state = MiddleInfo{
      a:true,
      s:emptyCell().asSlice(),
      i:InnerInfo{n:1, t:"abc"}
    };
  }
}