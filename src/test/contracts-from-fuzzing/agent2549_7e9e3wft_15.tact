struct InnerLayer {
  flag: Bool;
  text: String;
}

struct MiddleLayer {
  level: Int;
  detail: InnerLayer;
}

struct OuterLayer {
  tag: String?;
  payload: MiddleLayer;
}

contract DeepLayers {
  container: OuterLayer;

  init() {
    self.container = OuterLayer{
      tag: null,
      payload: MiddleLayer{
        level: 9,
        detail: InnerLayer{
          flag: true,
          text: "abc"
        }
      }
    };
  }
}