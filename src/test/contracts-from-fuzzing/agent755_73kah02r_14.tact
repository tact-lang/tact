struct DeepInner {
  x: String;
  y: String?;
}

struct DeepMid {
  label: String;
  di: DeepInner;
}

struct DeepOuter {
  title: String?;
  mid: DeepMid;
}

contract Test11 {
  val: DeepOuter;

  init() {
    self.val = DeepOuter{
      title: null,
      mid: DeepMid{
        label: "hello",
        di: DeepInner{
          x: "xval",
          y: null,
        }
      }
    };
  }
}
