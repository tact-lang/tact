struct ComposeOpt {
  c: Inner?;
  val: Int?;
}

struct Inner {
  x: Int;
  y: Int;
}

contract OptTest {
    co: ComposeOpt = ComposeOpt{ c:null, val:null };
}
